from django.urls import path
from .views import NoticeDetail, NoticeList

urlpatterns = [
    path('', NoticeList.as_view(), name="Notices"),
    path('<int:pk>/', NoticeDetail.as_view(), name="Notice Detail"),
]