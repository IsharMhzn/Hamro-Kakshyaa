from .models import Notice
from .serializers import NoticeSerializer

from rest_framework import generics

class NoticeList(generics.ListCreateAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeSerializer

class NoticeDetail(generics.RetrieveUpdateDestroyAPIView):
    queryset = Notice.objects.all()
    serializer_class = NoticeSerializer




# from rest_framework.decorators import api_view
# from rest_framework.response import Response
# from rest_framework.parsers import JSONParser
# from rest_framework import status


# # Create your views here.

# @api_view(['GET', 'POST'])
# def notice_list(request):
#     if request.method == 'GET':
#         notices = Notice.objects.all()
#         s = NoticeSerializer(notices, many=True)
#         return Response(s.data)
    
#     elif request.method == 'POST':
#         # data = JSONParser.parse(request)

#         s = NoticeSerializer(data = request.data)
#         if s.is_valid():
#             print(s.validated_data)
#             s.save()
#             return Response(s.data, status.HTTP_201_CREATED)
#         return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)

# @api_view(['GET', 'PATCH', 'DELETE'])
# def notice_detail(request, pk):
#     try:
#         n = Notice.objects.get(pk=pk)
#     except Notice.DoesNotExist:
#         return Response(status=status.HTTP_404_NOT_FOUND)
    
#     if request.method == 'GET':
#         s = NoticeSerializer(n)
#         return Response(s.data)
#     elif request.method == 'PATCH':
#         # data = JSONParser.parse(request)
#         print(request.data)
#         s = NoticeSerializer(n, data=request.data)
#         if s.is_valid():
#             s.save()
#             return Response(s.data)
#         return Response(s.errors, status=status.HTTP_400_BAD_REQUEST)
#     elif request.method == "DELETE":
#         n.delete()
#         return Response(status=status.HTTP_201_CREATED)