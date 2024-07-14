document.addEventListener('DOMContentLoaded', function() {
    // Update cart totals on page load
    updateCartTotal();

    document.querySelectorAll('.quantity-input').forEach(input => {
        input.addEventListener('change', function() {
            const id = this.dataset.id;
            const price = parseFloat(this.dataset.price);
            const quantity = parseInt(this.value);
            const subtotal = price * quantity;
            this.nextElementSibling.textContent = 'ج.م ' + subtotal.toFixed(2);
            updateCartTotal();
        });
    });

    const checkoutButton = document.querySelector('#checkoutButton');
    checkoutButton.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent the default behavior of the button
        const checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));

        // Populate order details
        const orderDetails = document.getElementById('orderDetails');
        orderDetails.innerHTML = ''; // Clear previous details

        document.querySelectorAll('.quantity-input').forEach(input => {
            const itemId = input.dataset.id;
            const itemTitle = input.closest('.card-body').querySelector('h5').textContent;
            const itemQuantity = input.value;
            const itemPrice = parseFloat(input.dataset.price);
            const itemSubtotal = (itemPrice * itemQuantity).toFixed(2);

            orderDetails.innerHTML += `
                <div class="bill-item">
                    <span>${itemQuantity} x ${itemTitle}</span>
                    <span>ج.م ${itemSubtotal}</span>
                </div>
            `;
        });

        // Show total at the bottom of the order details
        const total = document.getElementById('cart-total').textContent;
        orderDetails.innerHTML += `
            <div class="bill-total">الإجمالي: ج.م <strong>${total}</strong></div>
        `;

        checkoutModal.show(); // Show the modal
    });

    // Handle the form submission
    document.getElementById('submitCheckout').addEventListener('click', function() {
        const name = document.getElementById('name').value;
        const address = document.getElementById('address').value;
        const phone = document.getElementById('phone').value;

        // You can now send this data to your backend or process it as needed
        console.log({ name, address, phone });

        // Optionally close the modal
        const checkoutModal = bootstrap.Modal.getInstance(document.getElementById('checkoutModal'));
        checkoutModal.hide();
    });
});

function updateCartTotal() {
    let total = 0;
    let cart_total = 0;

    document.querySelectorAll('.quantity-input').forEach(input => {
        const price = parseFloat(input.dataset.price);
        const quantity = parseInt(input.value);
        total += price * quantity;
        cart_total += quantity;

        const itemId = input.dataset.id;
        document.getElementById(`item-quantity-${itemId}`).textContent = quantity; // Update quantity
        document.getElementById(`item-subtotal-${itemId}`).textContent = 'ج.م ' + (price * quantity).toFixed(2); // Update subtotal
    });

    document.getElementById('cart-total').textContent = total.toFixed(2);

    const cartBadge = document.querySelector('.cart_badge');
    if (cartBadge) {
        cartBadge.textContent = cart_total;
    }
}
