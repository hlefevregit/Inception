const text = "🚀 ft_transcendence is coming...";
const target = document.getElementById("teaser-title");

if (target) {
  let index = 0;

  const typeWriter = () => {
    if (index < text.length) {
      target.innerHTML += text.charAt(index);
      index++;
      setTimeout(typeWriter, 80);
    }
  };

  typeWriter();
}
