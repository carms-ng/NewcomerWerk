const loadCarousel = () => {

    const carousel = document.querySelector('.carousel__container');
    
    if (carousel) {
        const slider = carousel.querySelector('.carousel__slides');
        const slides = Array.from(slider.children);
        const nextBtn = carousel.querySelector('.carousel__btn--next');
        const prevBtn = carousel.querySelector('.carousel__btn--back');
        const slideWidth = slides[0].getBoundingClientRect().width;
    
        const positionSlides = (slide, index) => {
            slide.style.left = (slideWidth + 20) * index + 'px';
            prevBtn.style.display = 'none';
        }

        const updatePrevBtn = (targetSlide) => {
            prevBtn.style.display = targetSlide === slides[0] ? 'none' : 'block';
        }
    
        slides.forEach(positionSlides);
    
        const moveSlides = (distance, currentSlide, targetSlide) => {
            slider.style.transform = `translateX(-${targetSlide.style.left})`;
            currentSlide.classList.remove('active');
            targetSlide.classList.add('active');
            updatePrevBtn(targetSlide);
        }
    
        nextBtn.addEventListener('click', () => {
            const currentSlide = slider.querySelector('.active');
            let nextSlide = currentSlide.nextElementSibling;
            if (!nextSlide) { nextSlide = slides[0] }
    
            moveSlides(slider, currentSlide, nextSlide);
        })
    
        prevBtn.addEventListener('click', () => {
            const currentSlide = slider.querySelector('.active');
            let prevSlide = currentSlide.previousElementSibling;
            if (!prevSlide) { prevSlide = slides[slides.length - 1] }
    
            moveSlides(slider, currentSlide, prevSlide);
        })
    }
}

export { loadCarousel };
