from computedfields.models import computed, ComputedFieldsModel
from django.contrib.auth.base_user import BaseUserManager
from django.contrib.auth.models import AbstractUser
from django.core.exceptions import ValidationError
from django.db import models
from django.utils.translation import gettext_lazy as _


class UserManager(BaseUserManager):
    use_in_migrations = True

    def create_user(self, email, name, password=None, **extra_fields):
        extra_fields.setdefault('is_superuser', False)
        return self._create_user(email, name, password, **extra_fields)

    def create_superuser(self, email, name, password, **extra_fields):
        extra_fields.setdefault('is_superuser', True)
        extra_fields.setdefault('is_staff', True)
        if extra_fields.get('is_superuser') is not True:
            raise ValueError('Superuser must have is_superuser=True.')
        if not name:
            raise ValidationError('Name is required')

        return self._create_user(email, name, password, **extra_fields)

    def _create_user(self, email, name, password, **extra_fields):
        """
        Creates and saves a User with the given email and password.
        """
        if not email:
            raise ValidationError('Email is required')
        if not name:
            raise ValidationError('Name is required')
        user = self.model(email=email, name=name, **extra_fields)
        user.set_password(password)
        user.save(using=self._db)
        return user


class CustomUser(AbstractUser, ComputedFieldsModel):
    # We want a generic name not first and last names
    name = models.CharField(_("Name"), max_length=255, blank=False, null=False)
    email = models.EmailField(unique=True, blank=False, null=False)
    points = models.PositiveIntegerField(default=0)
    rank = models.CharField(max_length=255, blank=True, null=True)

    objects = UserManager()
    USERNAME_FIELD = "email"
    REQUIRED_FIELDS = ['name']

    RANKS = [
        ('Novice', 'Novice'),
        ('Apprentice', 'Apprentice'),
        ('Hero', 'Hero'),
        ('SuperHero', 'SuperHero'),
        ('Expert', 'Expert'),
        ('Master', 'Master')
    ]

    @computed(models.CharField(max_length=100, choices=RANKS, verbose_name='Rank', default='Novice',
                               blank=False, null=False), depends=[['self', ['points']]])
    def rank(self):
        if self.points >= 50000:
            return 'Master'
        elif self.points >= 20000:
            return 'Expert'
        elif self.points >= 10000:
            return 'SuperHero'
        elif self.points >= 5000:
            return 'Hero'
        elif self.points >= 2000:
            return 'Apprentice'
        else:
            return 'Novice'
