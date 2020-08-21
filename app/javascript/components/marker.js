
const initMarkerStyle = () => {
    const markers = document.querySelectorAll('.marker');
    
    const scaleUp = (e) => {
        const marker = e.currentTarget;
        const preTransform = marker.style.transform;
        marker.style.transform = `${preTransform} scale(1.2)`;
        marker.style.zIndex = 3;
        
        marker.addEventListener('mouseout', () => {
            marker.style.transform = preTransform;
            marker.style.zIndex = 1;
        })
    }
    
    const handleClick = (e) => {
        const marker = e.currentTarget;
        marker.style.color = 'grey';
    }

    if (markers) {
        markers.forEach(marker => {
            marker.addEventListener('mouseover', scaleUp);
        })
        markers.forEach(marker => {
            marker.addEventListener('click', handleClick);
        })
    }
}

export { initMarkerStyle };