# Testing Checklist - Project Showcase Features

## Pre-Flight Check

```bash
# 1. Install dependencies
flutter pub get

# 2. Verify no compilation errors
flutter analyze lib/ | grep error

# 3. Clean and rebuild
flutter clean
flutter pub get
```

---

## Feature 1: Hover Tooltips

**Test on Desktop/Web:**
1. Navigate to Projects section
2. Hover over any project card (e.g., Customer WIOM)
3. ✓ Verify tooltip appears above the project image showing impact metric
4. ✓ Example text: "✓ Reduced Google Places API costs from ₹18 to ₹9 per customer"
5. Hover away → tooltip disappears
6. Repeat for 2-3 different projects

**Expected Behavior:**
- Tooltip appears on hover
- Shows first impact metric from project details
- Smooth fade-in animation
- Works on all 13 projects

---

## Feature 2: Modal Dialog - Click to View Details

**Test on All Devices:**

### Desktop/Web:
1. Navigate to Projects section
2. Click any project card
3. ✓ Modal dialog opens with full project details
4. ✓ Verify modal contains:
   - Company name (e.g., "WIOM")
   - Project title (e.g., "Wiom Customer")
   - Short description
   - Detailed overview
   - Key Features section (bulleted list)
   - Impact & Achievements section (with ✓ symbols)
   - Technologies section (with chip styling)
   - Download/Website buttons (if applicable)
5. Click X button or outside modal → closes smoothly
6. Click another project → new modal opens with different content

### Mobile:
1. Same steps as desktop
2. ✓ Verify modal is readable on small screens
3. ✓ Verify scrolling works if content overflows
4. ✓ Verify buttons are tap-friendly

**Expected Behavior:**
- Modal opens centered on screen
- All project details display correctly
- Close button works
- Modal can be dismissed by clicking outside
- Smooth animations

**Test Projects to Check:**
- Partner V1 & V2 (verify different content)
- Customer WIOM (has ₹27 lakh savings metric)
- OZi (has most impact metrics)
- Jammerz (personal project example)

---

## Feature 3: Detail Page Navigation

**Test Route Navigation:**

1. If using browser dev tools, try direct navigation:
   - URL: `/project/customer_wiom`
   - ✓ Detail page loads with full project info
   
2. From modal, no direct navigation needed (modal is primary UX)

**Expected Behavior:**
- Detail page displays same content as modal
- All sections render correctly
- Responsive layout maintained
- No console errors

---

## Feature 4: PDF Export

**Test PDF Generation:**

1. Navigate to Projects section
2. Find "Download Portfolio" button (FloatingActionButton or button)
3. Click button
4. ✓ PDF generation starts
5. ✓ Save/Share dialog appears (OS-dependent)
6. Save PDF as `Rohitashwa_Portfolio.pdf`

**Verify PDF Contents:**
1. Open saved PDF in reader
2. ✓ Title page/first project visible
3. ✓ Page 2+: Different projects (one per page roughly)
4. ✓ Each project page contains:
   - Project title (large)
   - Company name
   - Short description
   - Full description
   - Key Features (bulleted)
   - Impact metrics (with ✓)
   - Technologies listed
5. ✓ All 13 projects included
6. ✓ No content cut off
7. ✓ Typography is readable
8. ✓ Can print without issues

**Expected Behavior:**
- PDF generates without errors
- PDF is valid and opens in readers
- All text is readable
- All projects are included
- Share dialog appears

---

## Responsive Design Testing

**Test on All Breakpoints:**

### Mobile (< 600px):
- [ ] Projects section displays in single column
- [ ] Modal fits on screen
- [ ] Tooltip still visible but not obstructing
- [ ] Buttons are tap-friendly (minimum 44x44dp)
- [ ] Scrolling works smoothly

### Tablet (600px - 1200px):
- [ ] Projects display in multi-column grid
- [ ] Modal is properly sized
- [ ] Text is readable
- [ ] All features functional

### Desktop (> 1200px):
- [ ] All features work as designed
- [ ] Hover effects work properly
- [ ] Modal is centered and sized well
- [ ] PDF export functional

---

## Data Verification

**Verify All 13 Projects Have Details:**

```dart
// In a test or debug screen, verify:
for (var entry in Data.projectDetails.entries) {
  print('${entry.key}: ${entry.value.title}');
  assert(entry.value.impact.isNotEmpty, 'Missing impact for ${entry.key}');
  assert(entry.value.keyFeatures.isNotEmpty, 'Missing features for ${entry.key}');
  assert(entry.value.technologies.isNotEmpty, 'Missing tech for ${entry.key}');
}
```

**Expected Output:** 13 projects, all with non-empty impact, features, and technologies.

**Projects to verify:**
- [ ] partner_v1
- [ ] partner_v2
- [ ] expert_app
- [ ] customer_wiom
- [ ] lms_wiom
- [ ] programming_hub
- [ ] grateful_diary
- [ ] neodocs_kidney
- [ ] pregafaith
- [ ] malaria_dengue
- [ ] moov_money
- [ ] jammerz
- [ ] ozi_user_app

---

## Performance Testing

**Desktop Performance:**
- [ ] Click project → Modal opens in < 200ms
- [ ] Hover → Tooltip appears smoothly
- [ ] No jank or stuttering
- [ ] Memory usage stays reasonable

**PDF Generation:**
- [ ] PDF generation completes in < 3 seconds
- [ ] No memory spikes
- [ ] No UI freeze during generation

---

## Browser Compatibility

**Test on:**
- [ ] Chrome/Chromium
- [ ] Firefox
- [ ] Safari
- [ ] Edge

**Expected:** All features work consistently across browsers

---

## Error Handling

**Test Error Cases:**
1. Try accessing non-existent project ID:
   - `Data.getProjectDetails('nonexistent')`
   - ✓ Should return null gracefully
   - ✓ Modal should show error message

2. Missing image for project:
   - Should display placeholder or graceful fallback
   - No crash

3. Invalid download URL:
   - Click should attempt to open URL
   - Graceful handling if URL invalid

---

## Integration Testing

**Test Cross-Feature Interactions:**

1. **Modal → PDF:**
   - Open modal
   - Click Download button in modal
   - Verify it opens external link (not PDF)

2. **Projects Section → All Features:**
   - Hover project (see tooltip)
   - Click project (see modal)
   - From modal, click Close
   - Verify can access PDF export button

3. **Multiple Projects:**
   - Click Project A (modal opens)
   - Close modal
   - Click different Project B
   - Verify different content loads

---

## Accessibility Testing

**Keyboard Navigation:**
- [ ] Tab through projects
- [ ] Tab to modal buttons
- [ ] Tab to close button
- [ ] Enter/Space to activate buttons

**Screen Reader:**
- [ ] Project titles read correctly
- [ ] Button labels are descriptive
- [ ] Modal announced properly

---

## Testing on Real Devices

**iOS (if applicable):**
- [ ] All features work
- [ ] PDF share sheet displays
- [ ] Touch targets adequate

**Android:**
- [ ] All features work
- [ ] PDF permissions handled
- [ ] PDF share works

---

## Final Sign-Off

- [ ] All 4 features tested ✓
- [ ] No console errors
- [ ] No memory leaks
- [ ] Responsive on all devices
- [ ] PDF export works
- [ ] Performance acceptable
- [ ] Ready for deployment

---

**Last Tested:** _______________
**Tester Name:** _______________
**Notes:** 
