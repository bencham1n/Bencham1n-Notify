window.addEventListener('message', function(event) {
    const data = event.data;
    if (data.action === "show") {
        let container = document.getElementById("notify-container");
        let notif = document.createElement("div");

        
        const isCustom = data.type === "custom";
        notif.className = `notify ${isCustom ? "" : data.type}`;

        let iconHTML = "";
        if (isCustom && data.icon) {
            iconHTML = `<i class="fa-solid ${data.icon}"></i>`;
        } else {
            if (data.type === "info") iconHTML = '<i class="fa-solid fa-info"></i>';
            if (data.type === "warning") iconHTML = '<i class="fa-solid fa-circle-exclamation"></i>';
            if (data.type === "success") iconHTML = '<i class="fa-solid fa-check"></i>';
            if (data.type === "error") iconHTML = '<i class="fa-solid fa-times"></i>';
        }

        notif.innerHTML = `${iconHTML}<div><strong>${data.title}</strong>${data.message}</div>`;

        
        if (isCustom && data.color) {
            notif.style.borderLeft = `5px solid ${data.color}`;
        }

        container.appendChild(notif);

        setTimeout(() => {
            notif.remove();
        }, data.duration || 5000);
    }
});
