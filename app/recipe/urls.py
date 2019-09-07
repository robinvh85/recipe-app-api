from django.urls import path, include
from rest_framework.routers import DefaultRouter

from recipe import views


router = DefaultRouter()
router.register('tags', views.TagViewSet)

app_name = 'recipe'

urlpatterns = [
    # when match recipe/, all url by DefaultRouter will be auto generated if TagViewSet have them
    path('', include(router.urls))
]
