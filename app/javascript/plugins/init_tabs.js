
// received.addEventListener("click", (event) => {
//   console.log(event);
// });

// Reviews Tabs
const tabReviewReceived = document.getElementById('tab-review-received');
const tabReviewWritten = document.getElementById('tab-review-written');

// Reviews view
const received = document.getElementById('received-review');
const written = document.getElementById('reviews-written');


// Reviews View & tabs functions
export const receivedReview = () => {
  // To display received review
  if (received.style.display === "none") {
    received.style.display = "block"
    written.style.display = "none"
    // highlight this tab
    tabReviewReceived.style.backgroundColor = "#230444"
    tabReviewReceived.style.color = "#FFFFFF"
    // unhighlight the other tab
    tabReviewWritten.style.backgroundColor = "#FFFFFF"
    tabReviewWritten.style.color = "#230444"
  }
  // To hide received reviews and show written reviews
  else {
    received.style.display = "none"
    written.style.display = "block"
    // unhighlight this tab
    tabReviewReceived.style.backgroundColor = "#FFFFFF"
    tabReviewReceived.style.color = "#230444"
    // highlight the other tab
    tabReviewWritten.style.backgroundColor = "#FFFFFF"
    tabReviewWritten.style.color = "#230444"
  };
};

export const writtenReview = () => {
  if (written.style.display === "none") {
    written.style.display = "block"
    received.style.display = "none"
    // highlight this tab
    tabReviewWritten.style.backgroundColor = "#230444"
    tabReviewWritten.style.color = "#FFFFFF"
    // unhighlight the other tab
    tabReviewReceived.style.backgroundColor = "#FFFFFF"
    tabReviewReceived.style.color = "#230444"
  } else {
    written.style.display = "none"
    received.style.display = "block"
    // unhighlight this tab
    tabReviewWritten.style.backgroundColor = "#FFFFFF"
    tabReviewWritten.style.color = "#230444"
    // highlight the other tab
    tabReviewReceived.style.backgroundColor = "#230444"
    tabReviewReceived.style.color = "#FFFFFF"
  };
};

