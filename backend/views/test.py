from rest_framework.views import APIView
from rest_framework.response import Response
from rest_framework import status
from django.shortcuts import get_object_or_404
from backend.serializers import TestSerializer
from backend.repositories import get_tests
from backend.models import Test
from drf_yasg.utils import swagger_auto_schema


class TestsView(APIView):
    @swagger_auto_schema(
        operation_description="Get all tests",
        responses={200: TestSerializer(many=True)}
    )
    def get(self, request):
        tests = get_tests()
        serializer = TestSerializer(tests, many=True)
        return Response(serializer.data)

    @swagger_auto_schema(
        operation_description="Create a new test",
        request_body=TestSerializer,
        responses={200: TestSerializer()}
    )
    def post(self, request):
        serializer = TestSerializer(data=request.data)
        if not serializer.is_valid():
            return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
        serializer.save()
        return Response(serializer.data)


class TestView(APIView):
    @swagger_auto_schema(
        operation_description="Get a test",
        responses={200: TestSerializer()}
    )
    def get(self, request, pk):
        test = get_object_or_404(Test, pk=pk)
        serializer = TestSerializer(test)
        return Response(serializer.data)

    @swagger_auto_schema(
        operation_description="Delete a test",
        responses={200: TestSerializer()}
    )
    def delete(self, request, pk):
        test = get_object_or_404(Test, pk=pk)
        test.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)
