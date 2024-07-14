document.addEventListener('DOMContentLoaded', function() {
    // Update cart totals on page load
    updateCartTotal();

    // Handle quantity changes
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

    // Handle the checkout button click
    const checkoutButton = document.getElementById('checkoutButton');
    checkoutButton.addEventListener('click', function(event) {
        event.preventDefault(); // Prevent default button behavior
        const checkoutModal = new bootstrap.Modal(document.getElementById('checkoutModal'));
        checkoutModal.show(); // Show the modal
    });

    // Update the cart total
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
