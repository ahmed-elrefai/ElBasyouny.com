document.addEventListener('DOMContentLoaded', function () {
    // Update cart totals on page load
    updateCartTotal();

    document.querySelectorAll('.quantity-input').forEach(input => {
        input.addEventListener('change', debounce(function () {
            const itemId = this.dataset.id;
            const price = parseFloat(this.dataset.price);
            const quantity = parseInt(this.value);
            const subtotal = price * quantity;
    
            // Update subtotal in the UI
            this.nextElementSibling.textContent = 'ج.م ' + subtotal.toFixed(2);
            updateCartTotal();
    
            // Send the update to the server
            const xhr = new XMLHttpRequest();
            xhr.open('POST', `/cart/update/${itemId}/`, true);
            xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
            xhr.setRequestHeader('X-CSRFToken', csrfToken);
            xhr.onload = function () {
                if (xhr.status === 200) {
                    console.log('Quantities updated successfully.');
                } else {
                    alert('An error occurred while updating quantities. Please try again.');
                    console.error(xhr.responseText);
                }
            };
            xhr.send(`quantity=${quantity}`);
        }, 500)); // Adjust debounce delay as needed
    });

    const checkoutButton = document.querySelector('#checkoutButton');
    checkoutButton.addEventListener('click', function (event) {
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

    document.getElementById('submitCheckout').addEventListener('click', function () {
        const name = document.getElementById('name').value;
        const address = document.getElementById('address').value;
        const phone = document.getElementById('phone').value;
        const email = document.getElementById('email').value;

        const data = {
            name: name,
            address: address,
            phone: phone,
            email: email
        };

        showLoadingIndicator(true);

        fetch('/cart/confirm-order/', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
                'X-CSRFToken': csrfToken
            },
            body: JSON.stringify(data)
        })
        .then(response => response.json())
        .then(data => {
            showLoadingIndicator(false);
            if (data.message) {
                showConfirmationModal(
                    'تأكيد الطلب',
                    'تم استلام طلبك. سنرسل تفاصيل الطلب إلى بريدك الإلكتروني. يرجى الانتظار لتواصل أحد ممثلينا.'
                );
            } else {
                showConfirmationModal('Oops!', 'Something went wrong: ' + data.error);
            }
        })
        .catch((error) => {
            showLoadingIndicator(false);
            console.error('Error:', error);
            showConfirmationModal('Oops!', 'An unexpected error occurred. Please try again.');
        });

        // Optionally close the checkout modal
        const checkoutModal = bootstrap.Modal.getInstance(document.getElementById('checkoutModal'));
        checkoutModal.hide();
    });

    function showLoadingIndicator(show) {
        const loadingIndicator = document.getElementById('loadingIndicator');
        if (show) {
            loadingIndicator.style.display = 'block';
        } else {
            loadingIndicator.style.display = 'none';
        }
    }

    function showConfirmationModal(title, message) {
        const confirmationModalTitle = document.getElementById('confirmationModalTitle');
        const confirmationModalBody = document.getElementById('confirmationModalBody');

        confirmationModalTitle.textContent = title;
        confirmationModalBody.textContent = message;

        const confirmationModal = new bootstrap.Modal(document.getElementById('confirmationModal'));
        confirmationModal.show();

        setTimeout(() => {
            confirmationModal.hide();
        }, 10000); // Show the modal for 10 seconds
    }
});

function debounce(func, wait) {
    let timeout;
    return function (...args) {
        const context = this;
        clearTimeout(timeout);
        timeout = setTimeout(() => func.apply(context, args), wait);
    };
}

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
