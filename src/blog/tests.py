from django.contrib.auth.models import User
from django.test import TestCase

# Create your tests here.
from blog.models import Post


class BlogTestCase(TestCase):
	def setUp(self):
		User.objects.create(
			username='tester',
			password='AsDf0987',
			email='tester@gmail.com'
		)

	def create_post(self):
		post_count = Post.objects.all().count()
		Post.objects.create(
			author=User.objects.first(),
			title='Post de prueba',
			text='Hola'
		)
		self.assertEquals(Post.objects.all().count(), post_count + 1)