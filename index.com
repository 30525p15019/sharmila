
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>😹 Funny Dancing Cats!</title>

<style>
    * {
        box-sizing: border-box;
    }

    body {
        margin: 0;
        min-height: 100vh;
        font-family: "Comic Sans MS", cursive, sans-serif;
        text-align: center;
        color: white;
        background: linear-gradient(135deg, #ff69b4, #8a2be2, #00bfff);
        background-size: 300% 300%;
        animation: rainbow 8s ease infinite;
        overflow-x: hidden;
    }

    @keyframes rainbow {
        0% { background-position: 0% 50%; }
        50% { background-position: 100% 50%; }
        100% { background-position: 0% 50%; }
    }

    h1 {
        font-size: clamp(2rem, 6vw, 3.5rem);
        margin: 30px 10px 5px;
        text-shadow: 4px 4px #ff1493;
        animation: wiggle 1s infinite;
    }

    .subtitle {
        font-size: 1.1rem;
        padding: 0 10px;
    }

    @keyframes wiggle {
        0%, 100% { transform: rotate(-2deg); }
        50% { transform: rotate(2deg); }
    }

    .dance-floor {
        display: flex;
        flex-wrap: wrap;
        justify-content: center;
        align-items: center;
        gap: 25px;
        padding: 35px 15px;
    }

    .cat-card {
        background: rgba(255, 255, 255, 0.2);
        border: 3px solid white;
        border-radius: 25px;
        padding: 20px;
        width: 210px;
        box-shadow: 0 10px 25px #4b0082;
        backdrop-filter: blur(5px);
    }

    .cat {
        font-size: 100px;
        display: inline-block;
        animation: dance 0.6s infinite alternate ease-in-out;
        cursor: pointer;
        user-select: none;
    }

    .cat-card:nth-child(2) .cat {
        animation-delay: 0.2s;
        animation-duration: 0.4s;
    }

    .cat-card:nth-child(3) .cat {
        animation-delay: 0.1s;
        animation-duration: 0.8s;
    }

    @keyframes dance {
        0% {
            transform: translateY(0) rotate(-15deg) scale(1);
        }
        50% {
            transform: translateY(-25px) rotate(15deg) scale(1.1);
        }
        100% {
            transform: translateY(0) rotate(-15deg) scale(0.95);
        }
    }

    .cat-card h2 {
        margin: 10px 0 0;
    }

    .cat-card p {
        margin-bottom: 0;
    }

    button {
        border: none;
        padding: 14px 24px;
        margin: 8px;
        border-radius: 30px;
        background: #ffeb3b;
        color: #542080;
        font-size: 1rem;
        font-weight: bold;
        cursor: pointer;
        box-shadow: 0 5px 0 #d6a900;
        transition: transform 0.2s;
    }

    button:hover {
        transform: scale(1.08);
    }

    button:active {
        transform: translateY(3px);
        box-shadow: 0 2px 0 #d6a900;
    }

    .crazy {
        animation-duration: 0.18s !important;
    }

    .message {
        font-size: 1.4rem;
        font-weight: bold;
        min-height: 45px;
        padding: 10px;
    }

    .footer {
        padding: 25px 10px;
        font-size: 0.9rem;
    }

    .confetti {
        position: fixed;
        top: -30px;
        font-size: 25px;
        pointer-events: none;
        animation: fall 3s linear forwards;
        z-index: 10;
    }

    @keyframes fall {
        to {
            transform: translateY(110vh) rotate(720deg);
            opacity: 0;
        }
    }

    .paused .cat {
        animation-play-state: paused;
    }

    @media (prefers-reduced-motion: reduce) {
        h1, body, .cat {
            animation-duration: 3s;
        }
    }
</style>
</head>

<body>

<h1>😹 THE CRAZY CAT DISCO 😹</h1>
<p class="subtitle">Warning: These cats have absolutely NO dance skills! 🕺🐈</p>

<div class="dance-floor">

    <div class="cat-card">
        <div class="cat" onclick="catTalk(0)">🐱</div>
        <h2>DJ Meow</h2>
        <p>Professional floor scratcher 🎧</p>
    </div>

    <div class="cat-card">
        <div class="cat" onclick="catTalk(1)">😹</div>
        <h2>Sir Wiggles</h2>
        <p>Powered by fish and chaos 🐟</p>
    </div>

    <div class="cat-card">
        <div class="cat" onclick="catTalk(2)">😼</div>
        <h2>Disco Kitty</h2>
        <p>Zero brain cells, 100% vibes ✨</p>
    </div>

</div>

<div class="message" id="message">
    Click a cat to make it talk! 😂
</div>

<div>
    <button onclick="toggleDance()">⏸️ Pause / Dance</button>
    <button onclick="crazyMode()">🔥 CRAZY MODE</button>
    <button onclick="party()">🎉 PARTY TIME!</button>
    <button onclick="meow()">🐱 MEOW!</button>
</div>

<p class="footer">
    Made with ❤️, cat hair, and questionable dance moves.
    <br>😻 Keep calm and let the cats dance!
</p>

<script>
    const messages = [
        "DJ Meow: MEOOOOW! Drop the tuna beat! 🎧",
        "Sir Wiggles: I meant to do that! 😂",
        "Disco Kitty: I'm too cool for this litter box. 😎",
        "Breaking news: Cats have taken over the internet! 📰",
        "Somebody call the cat-dance police! 🚨",
        "My human thinks I am sleeping. SURPRISE! 🕺"
    ];

    let paused = false;
    let crazy = false;

    function catTalk(index) {
        document.getElementById("message").textContent =
            messages[index] || messages[0];

        const cats = document.querySelectorAll(".cat");
        cats[index].style.transform = "scale(1.4) rotate(20deg)";

        setTimeout(() => {
            cats[index].style.transform = "";
        }, 300);
    }

    function toggleDance() {
        paused = !paused;
        document.body.classList.toggle("paused", paused);

        document.getElementById("message").textContent =
            paused ? "Shhh! The cats are taking a nap. 😴" :
                     "THE DISCO IS BACK! 🕺🐱";
    }

    function crazyMode() {
        crazy = !crazy;

        document.querySelectorAll(".cat").forEach(cat => {
            cat.classList.toggle("crazy", crazy);
        });

        document.getElementById("message").textContent =
            crazy ? "🚨 MAXIMUM CAT CHAOS ACTIVATED! 🚨" :
                    "Cats have returned to normal... sort of. 😹";
    }

    function party() {
        const emojis = ["🎉", "💖", "🐟", "✨", "🐾", "😹", "🎊"];

        for (let i = 0; i < 45; i++) {
            const piece = document.createElement("div");
            piece.className = "confetti";
            piece.textContent =
                emojis[Math.floor(Math.random() * emojis.length)];

            piece.style.left = Math.random() * 100 + "vw";
            piece.style.animationDelay = Math.random() * 1.5 + "s";

            document.body.appendChild(piece);
            setTimeout(() => piece.remove(), 5000);
        }

        document.getElementById("message").textContent =
            "🎉 CAT PARTY! EVERYONE GETS A FISH! 🐟";
    }

    function meow() {
        // Create a silly meow sound using the browser's audio engine.
        const AudioContext =
            window.AudioContext || window.webkitAudioContext;

        if (!AudioContext) {
            document.getElementById("message").textContent =
                "MEOOOOW! 😹 Your browser doesn't support sound.";
            return;
        }

        const audio = new AudioContext();
        const oscillator = audio.createOscillator();
        const gain = audio.createGain();

        oscillator.type = "sawtooth";
        oscillator.frequency.setValueAtTime(650, audio.currentTime);
        oscillator.frequency.exponentialRampToValueAtTime(
            250, audio.currentTime + 0.25
        );
        oscillator.frequency.exponentialRampToValueAtTime(
            500, audio.currentTime + 0.45
        );

        gain.gain.setValueAtTime(0.15, audio.currentTime);
        gain.gain.exponentialRampToValueAtTime(
            0.01, audio.currentTime + 0.5
        );

        oscillator.connect(gain);
        gain.connect(audio.destination);

        oscillator.start();
        oscillator.stop(audio.currentTime + 0.5);

        oscillator.onended = () => audio.close();

        document.getElementById("message").textContent =
            "MEEEEEEOOOOOWWWWW! 😹🐈";
    }
</script>

</body>
</html>
