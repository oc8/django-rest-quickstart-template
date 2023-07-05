from rest_framework.serializers import ModelSerializer
from backend.models import Test


class TestSerializer(ModelSerializer):
    class Meta:
        model = Test
        fields = ['name']
