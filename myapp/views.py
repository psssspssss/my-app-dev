from django.http import JsonResponse
from .models import User
from django.views.decorators.csrf import csrf_exempt
import json

@csrf_exempt
def add_user(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        new_user = User(name=data['name'], email=data['email'])
        new_user.save()
        return JsonResponse({'message': 'User added successfully'})

def get_users(request):
    users = User.objects.all()
    user_list = [{'name': user.name, 'email': user.email} for user in users]
    return JsonResponse({'users': user_list})
