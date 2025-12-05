You are helping implement two features in a Flutter sandwich shop app: 
1) cart item editing 
2) a simple profile screen.

Context:
- Screens: 
  - Order screen (select sandwiches and add them to the cart)
  - Cart screen (view items and totals, edit quantities)
  - Profile screen (enter/view simple user details)
- Models: 
  - Sandwich (type, size, bread)
  - Cart (add/remove items, calculate total price)
- Repository:
  - Pricing (calculates price based on size and quantity only; sandwich type and bread do not affect the price)

------------------------------------------------------------
FEATURE 1 — Cart Editing
------------------------------------------------------------

Goal:
Allow users to modify items already in their cart.

Expected behavior:
1) Change quantity
   - Add "+" and "–" controls on each cart item.
   - "+" increases quantity; "–" decreases quantity.
   - Prevent quantity < 1; if "–" would reach 0, treat it as "remove item" or disable the button.
   - Update line subtotal and cart total immediately.
   - Keep changes in Cart state so totals remain correct after navigation.

2) Remove item
   - Provide a remove action (trash icon, swipe action, menu).
   - Removing an item updates cart total.
   - If all items are removed, show an empty-state message.

3) Cart totals
   - Recalculate totals instantly after any change.
   - Use Pricing repository (size × quantity only).
   - Sandwich type and bread must not affect price.

4) Feedback and UX safeguards
   - Optionally show a confirmation or undo (snackbar/dialog).
   - Disable “–” at quantity 1 if not removing the item.
   - Keep UI responsive during quick repeated changes.

What to produce for this feature:
- Updated Dart UI code for Cart screen widgets.
- Updated Cart model logic if needed.
- Helper methods for subtotal and total recalculation using Pricing.
- Widget tests for:
  - quantity changes,
  - removing items,
  - updating totals.

------------------------------------------------------------
FEATURE 2 — Profile Screen
------------------------------------------------------------

Goal:
Add a simple profile screen so users can view and enter their details.

Expected behavior:
1) New screen: ProfileScreen
   - Fields: name, email, optional extra field (e.g., phone).
   - Stores values locally only (no backend, no auth).
   - Save button becomes active only when required fields are entered.
   - On Save, show a friendly snackbar (“Profile saved”).

2) Navigation:
   - Add a temporary link/button at the bottom of the Order screen to open ProfileScreen.
   - Use Navigator.push for now (navigation will be improved later).

3) UI:
   - Use simple Flutter widgets (TextField, ElevatedButton).
   - Use existing app styles where possible.
   - Keep the layout minimal and clean.

What to produce for this feature:
- A new file for ProfileScreen (e.g., lib/views/profile_screen.dart).
- Updated OrderScreen to include a button/link opening the ProfileScreen.
- Widget tests that check:
  - ProfileScreen renders correctly,
  - fields accept text input,
  - save button logic (enabled/disabled),
  - snackbar appears on Save,
  - navigation from OrderScreen to ProfileScreen works.

------------------------------------------------------------
General Notes:
- Keep solutions simple and beginner-friendly.
- Follow existing file structure (views/models/repositories).
- Explain briefly where each piece of new code belongs.
