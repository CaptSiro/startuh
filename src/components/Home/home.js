const gallery = new Gallery();

for (const image of $$(".gallery-image")) {
    const cursor = gallery.add(image.src, image.alt, image.title);
    image.addEventListener("click", () => {
        gallery.show();
        gallery.goTo(cursor);
    });
}