from django.urls import path
from .views import NoticeCreate, NoticeDetail, NoticeList

urlpatterns = [
    path('', NoticeList.as_view(), name="Notices"),
    path('create/', NoticeCreate.as_view(), name="Create Notice"),
    path('<int:pk>/', NoticeDetail.as_view(), name="Notice Detail"),
]