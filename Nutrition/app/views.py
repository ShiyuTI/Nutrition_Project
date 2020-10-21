from django.contrib.auth.models import User
from django.shortcuts import render, redirect, reverse
from django.views.generic import View
from django.contrib.auth.hashers import make_password
from django.contrib.auth import login, logout, authenticate

class Register(View):
	TEMPLATE = 'register.html'

	def get(self, request):
		error = request.GET.get('error')

		if request.user.is_authenticated:
			return redirect(reverse('login'))

		if error == None:
			error = ""

		return render(request, self.TEMPLATE, {'error': error})

	def post(self, request):
		username = request.POST.get('username')
		password = request.POST.get('password')
		check_password = request.POST.get('check_password')

		if password != check_password:
			return redirect('/register?error=Password Not Match')

		exists = User.objects.filter(username=username).exists()
		if exists:
			return redirect('/register?error=This username is used')

		hash_password = make_password(password)

		user= User.objects.create_user(
			username=username,
			password=password
		)
		user.save()

		return redirect(reverse('login'))

class ToLogin(View):

	def get(self, request):

		return redirect(reverse('login'))


class Login(View):
	TEMPLATE = 'login.html'

	def get(self, request):

		error = request.GET.get('error')

		if error == None:
			error = ""
		
		return render(request, self.TEMPLATE, {'error': error})

	def post(self, request):
		username = request.POST.get('username')
		password = request.POST.get('password')

		exists = User.objects.filter(username=username).exists()

		if not exists:
			return redirect('/login?error=Username is not registered')

		user = authenticate(username=username, password=password)

		if user:
			login(request, user)
		else:
			return redirect('/login?error=Invalid Password')

		return redirect('login')


class LogoutUser(View):
	def get(self, request):

		logout(request)

		return redirect(reverse('login'))



		