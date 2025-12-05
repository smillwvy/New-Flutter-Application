You are helping implement cart item editing in a Flutter sandwich shop app.

Context:
- Screens: Order screen (select sandwiches and add to cart), Cart screen (shows cart items + total).
- Models: Sandwich (type, size, bread type), Cart (add/remove/clear, total price calculation).
- Repository: Pricing (calculates price based on quantity and size only; sandwich type and bread do not affect price).

Goal:
Add cart editing so users can modify items already in their cart.

Features and expected behavior:
1) Change quantity of an item
   - Allow increment/decrement from the Cart screen.
   - Prevent quantity < 1; if decrement would hit 0, either block or treat as remove (see remove flow).
   - Update line item subtotal and cart total immediately.
   - Persist changes in Cart state so navigation between screens keeps updated values.

2) Remove an item
   - Provide a remove action on each cart item (trash icon, swipe-to-delete, or long-press menu).
   - Removing deletes the item from the cart list and updates the cart total.
   - If the cart becomes empty, show the empty-state UI.

3) Cart total updates
   - Any quantity change or removal recalculates the total price and reflects in the UI without a full page refresh.
   - Ensure totals stay in sync even if multiple edits happen quickly.

4) Pricing constraints
   - Use the Pricing repository to compute price based on size and quantity only.
   - Sandwich type and bread type must not affect pricing.

5) UX safeguards
   - Optionally confirm remove (dialog/snackbar with undo).
   - Disable decrement at quantity 1 (if not treating 0 as remove).
   - Keep interactions snappy; show loading/disabled only if async work is required.

What to produce:
- Dart/Flutter code changes for the Cart screen (widgets + state management) to support quantity change and removal.
- If state management (Provider/Bloc/SetState/etc.) needs hooks, add/adjust methods for quantity change and removal on the Cart model and wire UI actions to them.
- Include helper functions for subtotal/total recalculation using the Pricing repository.
- If tests exist, add/adjust tests for quantity change, removal, and total updates; otherwise, describe minimal test cases.
- Briefly explain where to place new code and how it integrates with existing Order and Cart flows.
