from .GmailClass import build_gmail_service, send_message
class Order:
    def __init__(self, order_details, order_location) -> None:
        self.service = build_gmail_service()
        self.providers_mail = "elrefaayahmed196@gmail.com"
        self.order_details = order_details
        self.order_location = order_location
    
    def send_order(self):
        send_message(
            self.service,
            self.providers_mail, 
            f"Order at {self.order_location}",
            self.order_details)