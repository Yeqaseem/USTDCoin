<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>USTD - Decentralized USD Token</title>
  <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600;800&display=swap" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />
  <link rel="icon" type="image/png" href="logo.png">

  <style>
    * { box-sizing: border-box; }
    body {
      margin: 0;
      font-family: 'Inter', sans-serif;
      background: linear-gradient(to right, #0f2027, #203a43, #2c5364);
      color: #fff;
    }
    header {
      padding: 20px 30px;
      display: flex;
      justify-content: space-between;
      align-items: center;
      flex-wrap: wrap;
      background: rgba(0, 0, 0, 0.2);
    }
    header h1 {
      font-size: 1.6rem;
      font-weight: 800;
      display: flex;
      align-items: center;
    }
    header h1 img {
      height: 40px;
      margin-right: 10px;
    }
    nav {
      display: flex;
      flex-wrap: wrap;
    }
    nav a {
      margin: 10px;
      color: #ffffffcc;
      text-decoration: none;
      font-weight: 600;
    }
    .hero {
      text-align: center;
      padding: 60px 20px;
    }
    .hero h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
    }
    .hero p {
      font-size: 1.1rem;
      max-width: 700px;
      margin: auto;
      color: #ddd;
    }
    .hero img {
      width: 100%;
      max-width: 500px;
      margin-top: 30px;
      border-radius: 12px;
      box-shadow: 0 10px 20px rgba(0,0,0,0.4);
    }
    .buttons {
      margin-top: 40px;
    }
    .buttons a {
      padding: 12px 24px;
      background: #00c896;
      color: #fff;
      text-decoration: none;
      border-radius: 6px;
      margin: 10px;
      display: inline-block;
      font-weight: 600;
    }
    section {
      padding: 50px 30px;
      max-width: 1100px;
      margin: auto;
    }
    section h3 {
      font-size: 2rem;
      margin-bottom: 20px;
    }
    section p {
      font-size: 1.1rem;
      color: #ccc;
      line-height: 1.6;
    }
    .social-icons {
      margin-top: 30px;
      text-align: center;
    }
    .social-icons a {
      color: #fff;
      margin: 0 10px;
      font-size: 1.5rem;
      text-decoration: none;
    }
    footer {
      text-align: center;
      padding: 30px 20px;
      font-size: 0.9rem;
      background-color: #00000033;
      color: #aaa;
    }
    @media (max-width: 768px) {
      header {
        flex-direction: column;
        text-align: center;
      }
      nav {
        justify-content: center;
      }
      .hero h2 {
        font-size: 2rem;
      }
    }
    a{
        text-decoration:none;
        color:white;
    }
  </style>
</head>
<body>
  <header>
   <a href="index.php"> <h1><img src="logo.png" alt="USTD Logo">USTD Token</h1></a>
    <nav>
      <a href="#about"><i class="fas fa-info-circle"></i> About</a>
      <a href="whitepaper.php"><i class="fas fa-file-alt"></i> Whitepaper</a>
      <a href="#roadmap"><i class="fas fa-road"></i> Roadmap</a>
      <a href="#faq"><i class="fas fa-question-circle"></i> FAQ</a>
      <a href="#contact"><i class="fas fa-envelope"></i> Contact</a>
    </nav>
  </header>

  <section class="hero">
    <h2>The Future of Decentralized USD</h2>
    <p>USTD is a decentralized stable digital token pegged to the US Dollar and backed by liquidity on the BNB Smart Chain.</p>
    <div class="buttons">
      <a href="https://bscscan.com/token/0x7318051CbC9E1C7C6666A5F68247208F2938142d" target="_blank"><i class="fas fa-search"></i> View on BscScan</a>
      <a href="https://pancakeswap.finance" target="_blank"><i class="fas fa-exchange-alt"></i> Buy on PancakeSwap</a>
      <a href="#whitepaper"><i class="fas fa-book"></i> Read Whitepaper</a>
    </div>
    <img src="https://public.bnbstatic.com/static/academy/uploads/d257fb0eb8b64534873aebc71e16d479.jpg" alt="Blockchain Illustration">
  </section>

  <section id="about">
    <h3>About USTD</h3>
    <p>USTD is a fully decentralized token designed to mimic the stability of the US Dollar through liquidity pairing and automated market-making. It runs on BNB Smart Chain.</p>
  </section>

  <section id="whitepaper">
    <h3>Whitepaper</h3>
    <p>Read our whitepaper to explore the technical background, vision, and roadmap.</p>
    <div class="buttons">
      <a href="whitepaper.php" target="_blank"><i class="fas fa-eye"></i> read more</a>
    </div>
  </section>

  <section id="roadmap">
    <h3>Roadmap</h3>
    <p>
      <strong>Q1 2025:</strong> Token launch, Liquidity setup<br>
      <strong>Q2 2025:</strong> DEX integrations, social media<br>
      <strong>Q3 2025:</strong> Trust Wallet listing, community growth<br>
      <strong>Q4 2025:</strong> Expansion + partnerships
    </p>
  </section>

  <section id="faq">
    <h3>Frequently Asked Questions</h3>
    <p><strong>Is USTD real?</strong><br>It is a flash token for demo and educational purposes, mimicking stablecoin behavior.</p>
    <p><strong>Can I trade it?</strong><br>Yes, on PancakeSwap using its official contract.</p>
  </section>

  <section id="contact">
    <h3>Connect With Us</h3>
    <div class="social-icons">
      <a href="https://t.me/ustdusdcoin"><i class="fab fa-telegram"></i></a>
      <a href="#"><i class="fab fa-twitter"></i></a>
      <a href="#"><i class="fab fa-discord"></i></a>
      <a href="#"><i class="fab fa-facebook"></i></a>
      <a href="#"><i class="fas fa-envelope"></i></a>
    </div>
  </section>

  <footer>
    &copy; 2025 USTD Token. All rights reserved.
  </footer>
</body>
</html>
