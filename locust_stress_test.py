from locust import HttpUser, task, between

class WebsiteUser(HttpUser):
    wait_time = between(5, 9)  # Time between requests

    @task
    def view_cart(self):
        self.client.get("/cart/show-cart/")  # Adjust URL as per your app

    @task
    def view_homepage(self):
        self.client.get("/")  # Adjust URL as per your app
