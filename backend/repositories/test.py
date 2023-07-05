from backend.models import Test


def get_tests():
    """Return all tests."""
    return Test.objects.all()
