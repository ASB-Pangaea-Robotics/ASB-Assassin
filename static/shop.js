window.addEventListener('DOMContentLoaded', function () {
  const name    = localStorage.getItem('user_name');
  const picture = localStorage.getItem('user_picture');

  // if (!name) {
  //   window.location.href = 'login.html';
  //   return;
  // }

  if (document.getElementById('nav-username')) {
    document.getElementById('nav-username').textContent = name || 'USER_NAME';
  }

  const avatar = document.getElementById('nav-avatar');
  avatar.src = picture;
  avatar.style.display = 'block';
});

function signOut() {
  localStorage.removeItem('user_name');
  localStorage.removeItem('user_email');
  localStorage.removeItem('user_picture');
  google.accounts.id.disableAutoSelect();
  window.location.href = 'login.html';
}

// ===== PURCHASE MODAL =====

// Item catalogue — add/edit items here
const SHOP_ITEMS = {
  'REVIVE':        { price: 2000 },
  'BOUNTY':        { price: 500  },
  'PUBLIC_BOUNTY': { price: 2000 },
};

// Target list — replace with real names as needed
const TARGETS = [
  'Aadith Kacholia',
  'Riya Sharma',
  'Kabir Mehta',
  'Ananya Iyer',
  'Dev Patel',
];

let currentItem = null;
let currentQty  = 1;

function openPurchaseModal(itemName) {
  currentItem = itemName;
  currentQty  = 1;

  const item = SHOP_ITEMS[itemName];

  // Set modal content
  document.getElementById('modal-item-name').textContent = itemName;
  document.getElementById('modal-price-value').textContent =
    item.price.toLocaleString('en-IN');
  document.getElementById('modal-qty-display').textContent = 1;
  updateTotalPrice();

  // Populate target dropdown
  const select = document.getElementById('modal-target-select');
  select.innerHTML = TARGETS.map(t => `<option value="${t}">${t}</option>`).join('');

  // Show modal
  document.getElementById('purchase-modal').classList.add('open');
}

function closePurchaseModal() {
  document.getElementById('purchase-modal').classList.remove('open');
  currentItem = null;
  currentQty  = 1;
}

function changeQty(delta) {
  currentQty = Math.max(1, currentQty + delta); // minimum 1
  document.getElementById('modal-qty-display').textContent = currentQty;
  updateTotalPrice();
}

function updateTotalPrice() {
  if (!currentItem) return;
  const unit  = SHOP_ITEMS[currentItem].price;
  const total = unit * currentQty;
  document.getElementById('modal-price-value').textContent =
    total.toLocaleString('en-IN');
}

function confirmPurchase() {
  const target = document.getElementById('modal-target-select').value;
  const total  = SHOP_ITEMS[currentItem].price * currentQty;

  // TODO: send to backend
  console.log('Purchase confirmed:', {
    item:     currentItem,
    quantity: currentQty,
    target:   target,
    total:    total,
  });

  // Close modal — replace alert with your own success UI if you want
  closePurchaseModal();
  alert(`Purchase confirmed!\n${currentQty}x ${currentItem} for ${target}\nTotal: ₹${total.toLocaleString('en-IN')}`);
}

// Close modal when clicking the dark overlay background
document.getElementById('purchase-modal').addEventListener('click', function (e) {
  if (e.target === this) closePurchaseModal();
});