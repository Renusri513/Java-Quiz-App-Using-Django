
# Register your models here.
from django.contrib import admin
from .models import Quiz, Question

# Registering the models
admin.site.register(Quiz)
admin.site.register(Question)
