from django.test import TestCase
from backend.models import Test


class TestView(TestCase):
    def setUp(self):
        # Ajouter des données temporaires à la base de données
        Test.objects.create(name='Test 1')
        Test.objects.create(name='Test 2')

    def tearDown(self):
        # Supprimer les données temporaires de la base de données
        Test.objects.all().delete()

    def test_get(self):
        """Test the GET method of TestView. Returns all tests."""
        response = self.client.get('/tests/')
        self.assertEqual(response.status_code, 200)
        self.assertEqual(response.data, [
            {'name': 'Test 1'},
            {'name': 'Test 2'}
        ])
