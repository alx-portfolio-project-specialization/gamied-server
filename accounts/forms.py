from django import forms
from django.contrib.auth.forms import UserCreationForm, UserChangeForm

from accounts.models import CustomUser


class RegisterUserForm(UserCreationForm):
    class Meta:
        model = CustomUser
        fields = ['email', 'password1', 'password2']


class EditUserForm(UserChangeForm):
    class Meta:
        model = CustomUser
        fields = ["name", "email", 'password', 'is_staff', 'is_superuser', 'date_joined']
