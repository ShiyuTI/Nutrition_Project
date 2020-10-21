from django.urls import path
from .views import Register, Login, ToLogin, LogoutUser

urlpatterns = [
	path('register', Register.as_view(), name = 'register'),
	path('login', Login.as_view(), name = 'login'),
	path('tologin', ToLogin.as_view(), name = 'tologin'),
	path('logoutuser', LogoutUser.as_view(), name = 'logoutuser')
]