from django.urls import path
from .views import add_user, get_users

urlpatterns = [
    path('add_user/', add_user, name='add_user'),
    path('get_users/', get_users, name='get_users'),
]
