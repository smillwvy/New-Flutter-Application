# Cart Modification Feature Requirements

## 1. Feature Description and Purpose
The cart page lets sandwich shop customers change their order before checkout. They can raise or lower quantities or remove sandwiches. Changing sandwich options (size, bread, type) is not done here—add a new item from the order screen for that. Pricing uses size and quantity only; sandwich type and bread never change the price.

## 2. User Stories
- Adjust Quantity: As a shopper, I can tap "+" to add one more or "–" to subtract one, so I get the exact number I want. If I go below 1, the item is removed automatically.
- Remove Item: As a shopper, I can remove a sandwich with one action (trash icon, swipe, or menu), so I can quickly clean up my cart.
- Feedback and Accuracy: As a shopper, I see totals and line prices update right away after any change, get a small confirmation (e.g., snackbar) when I remove or update an item, and see a clear empty-cart message when nothing is left.

## 3. Acceptance Criteria
### 3.1 Quantity Adjustment
- Each cart item shows "+" and "–" controls.
- "+" adds 1; "–" subtracts 1.
- At 1, "–" is disabled or triggers removal; never allow negative quantities.
- Line subtotal and cart total recalc instantly using size × quantity; type and bread do not affect price.

### 3.2 Remove Item
- Each cart item has a remove action.
- Removing deletes the item and updates the total.
- A confirmation or undo can appear (dialog/snackbar) to avoid mistakes.

### 3.3 General UI and Behavior
- All edits appear immediately without a full page refresh.
- Totals stay accurate even with quick, repeated edits.
- Empty cart shows a friendly message and a path back to ordering.

## 4. Subtasks
- Add "+"/"–" controls to each cart item and wire them to quantity change logic.
- If quantity would drop below 1, remove the item instead; keep UI from showing negatives.
- Add a remove action (trash icon or swipe) for each item.
- Recalculate and display line subtotals and cart total on every change using the Pricing repository (size + quantity).
- Show user feedback (snackbar/dialog) on remove/update and display an empty-state view when the cart is cleared.
