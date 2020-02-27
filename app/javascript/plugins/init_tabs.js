
// received.addEventListener("click", (event) => {
//   console.log(event);
// });

const received = document.getElementById('received-review');
const written = document.getElementById('reviews-written');

export const receivedReview = () => {
  if (received.style.display === "none") {
    received.style.display = "block"
    written.style.display = "none"
  } else {
    received.style.display = "none"
    written.style.display = "block"
  };
};

export const writtenReview = () => {
  if (written.style.display === "none") {
    written.style.display = "block"
    received.style.display = "none"
  } else {
    written.style.display = "none"
    received.style.display = "block"
  };
};

