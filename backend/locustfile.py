from locust import HttpUser, TaskSet, task, between
from urllib import parse
import json

class UserBehavior(TaskSet):
    def on_start(self):
        response = self.client.get("/cart/show-cart/")
        self.csrf_token = response.cookies['csrftoken']
        print(self.csrf_token)
    
    @task(1)
    def start(self):
        self.client.get("/")

    @task(2)
    def add_to_cart(self):
        self.client.get("/cart/add/1/")
        self.client.get("/cart/add/1/")
        self.client.get("/cart/add/1/")

    @task(3)
    def change_quantity(self):
        item_id = 1
        quantity = 3
        payload = parse.urlencode({"quantity": quantity})
        headers = {
            "Content-Type": "application/x-www-form-urlencoded",
            "X-CSRFToken": self.csrf_token
        }
        response = self.client.post(f"/cart/update/{item_id}/", data=payload, headers=headers)
        if response.status_code == 200:
            print('Quantities updated successfully.')
        else:
            print('Failed to update quantities:', response.text)

    @task(4)
    def confirm_order(self):
        name = "Ahmed"
        address = "26 port said st"
        email = "test@example.com"
        phone = "12345"

        headers = {'Content-Type': 'application/json', 'X-CSRFToken': self.csrf_token}
        data = json.dumps({'name': name, 'address': address, 'email': email, 'phone': phone})

        response = self.client.post("/cart/confirm-order/", data=data, headers=headers)
        
        if response.status_code == 200:
            try:
                response_data = response.json()
                if 'message' in response_data:
                    print('Order confirmed successfully!')
                else:
                    print('Failed to confirm order: ', response_data.get('error', 'Unknown error'))
            except ValueError:
                print('Failed to parse response as JSON:', response.text)
        else:
            print('Failed to send order confirmation: ', response.text)
        

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)
