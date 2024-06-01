from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.utils.translation import gettext_lazy as _
from .forms import EditUserForm, RegisterUserForm
from .models import CustomUser


@admin.register(CustomUser)
class UserModelAdmin(UserAdmin):
    form = EditUserForm
    add_form = RegisterUserForm
    add_fieldsets = (
        (None, {
            'classes': ('wide',),
            'fields': ('name', 'email', 'password1', 'password2'),
        }),
    )
    fieldsets = (
        (_('General information'), {'fields': ('name', 'email', 'password')}),
        (_('Extra information'), {'fields': ('points', 'rank', 'avatar')}),
        (_('Permissions'), {
            'fields': ('is_active', 'is_staff', 'is_superuser'),
        }),
        (_('Important dates'), {'fields': ('last_login', 'date_joined')}),
    )
    readonly_fields = ['last_login', 'date_joined', 'points', 'rank']
    list_display = ['name', 'email']
