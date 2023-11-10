# E-WASTE LOCATOR APP

<details>
  <summary>Introduction</summary>

  Imagine a world where responsible e-waste disposal is not just a choice but a seamless and rewarding experience. Our project is your gateway to this reality. We've designed an innovative web app that identifies devices, locates e-waste centers, educates users, and rewards eco-conscious actions. Let's revolutionize e-waste management together.
</details>

<details>
  <summary>Architecture</summary>

  Users interact with the app on their devices, which sends requests to a web application. The web app handles user accounts, points, and device identification, and can use external services like mapping. A web server serves the app, and a database stores user data, facility info, and content. External services help with translation and mapping. Physical e-waste facilities are part of the system too.

</details>

<details>
  <summary>Proposed Methodology</summary>

  Addressing the pressing issue of E-waste, our solution educates users on proper disposal. We integrate an E-waste facility locator, promoting responsible disposal. A rewards system incentivizes users, with points redeemable during future electronic purchases. Our innovation is a user-friendly scanning feature, aiding those unfamiliar with tech. It identifies devices and educates users on precious metal composition, ensuring a seamless experience.
</details>

<details>
  <summary>Design Aspect</summary>

  - Simple, visually appealing and easy navigation to key features device scanning, nearest e-waste centers, educational resources, and user profiles.
  - The homepage presents information in clear and concise aesthetic cards and sections, ensuring users stay engaged.
  - We've included impactful images, essential facts, and "did you know" sections in a striking color to educate users on e-waste's environmental impact.
  - A prominent CTA button guides users to the education page, offering in-depth information, disposal tutorials, and further exploration.
  - Our educational resources also highlight a three-pronged sustainability approach—covering environmental, economic, and social responsibilities.

  ![Sample Image](https://github.com/Techtidy/my-app-dev/assets/131174948/668d833c-7b95-4060-bd6d-605840fb27f5)
</details>

<details>
  <summary>Tools Used</summary>

  - Image Identification (Device Type)
  - Nearby E-Waste Location Services
  - Rewards Management
  - External Services
  - Web Server and Hosting
</details>

<details>
  <summary>Flowchart</summary>

  ```mermaid
  flowchart TD
      A[Start] -->B(User Registration);
      B --> G[Educational resources];
      B --> L[Home];
      L --> M[Scanning];
      M --> N[E-waste locator];
      N --> O[metal composition];
      O --> P[Points];
      P --> Q[end];
      B --> I[Profile];
      I --> R[Disposal history];
      R --> S[Approval];
      S --> T[Total points];
      T --> U[Redeem points];
      U-->Q[end];
      G -->J[harmful effects];
      J -->K[Environmental impacts];
      K -->Q[end];
```
</details>

