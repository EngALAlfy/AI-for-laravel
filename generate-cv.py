from fpdf import FPDF

class CV(FPDF):
    def __init__(self):
        super().__init__()
        self.add_page()
        self.set_font("Arial", "", 11)
        self.set_auto_page_break(auto=True, margin=15)
        # Add header content in init instead of header method
        self.set_font("Arial", "B", 14)
        self.cell(0, 10, "Islam Hassan Abd Allah Alalfy - Senior Software Engineer", ln=True, align="C")
        self.set_font("Arial", "", 10)
        self.cell(0, 6, "Cairo, Egypt | +20 109 855 9403 | islam@alalfy.com", ln=True, align="C")
        self.set_text_color(0, 0, 255)
        self.set_font("Arial", "U", 10)
        self.cell(0, 6, "Website: alalfy.com | LinkedIn | GitHub", ln=True, align="C", link="https://alalfy.com")
        self.set_text_color(0, 0, 0)
        self.ln(5)
        self.line(10, self.get_y(), 200, self.get_y())
        self.ln(5)

    def header(self):
        # Empty header method to prevent repetition
        pass
    def section(self, title, body):
        self.set_font("Arial", "B", 12)
        self.set_fill_color(240, 240, 240)
        self.cell(0, 8, title, ln=True, fill=True)
        self.ln(1)
        self.set_font("Arial", "", 11)
        self.multi_cell(0, 6, body)
        self.ln(3)

pdf = CV()

pdf.section("Professional Summary",
    "Senior Software Engineer with 5+ years of experience in web and mobile development using Laravel and Flutter. "
    "Experienced in DevOps, team leadership, and building scalable systems with AI API integration and Docker deployment."
)


pdf.section("Work Experience", 
"""Team Lead - Flutter & Laravel
Bakka Soft, Cairo | Dec 2022 - Present
- Led a team of 4+ developers to deliver large-scale systems with integrated POS and mobile ordering.
- Boosted server capacity from <1000 to 3000+ concurrent customers/min through Laravel and DevOps optimizations.
- Reduced mobile API response time from 5s to under 1s via performance profiling and caching.
- Managed CI/CD workflows using Docker and GitHub Actions across staging and production.
- Contributed to HurryApp: food delivery platform with 300+ restaurants and thousands of active users/month.
- Created internal documentation, onboarding materials, and deployment runbooks for cross-team collaboration.

Senior Software Engineer
GRE Development, London | Feb 2024 - Oct 2024
- Led development of multi-tenant SaaS e-commerce platform (like Shopify/Salla) with 421K+ registered merchants in Saudi Arabia.
- Designed scalable backend infrastructure with payment integrations and vendor dashboards.
- Developed and maintained payment module handling thousands of transactions/month securely.
- Delivered project documentation, API reference, and support handover to internal teams.

Founder & Lead Developer
YoTech, Cairo | Jan 2024 - Present
- Delivered 4+ complete e-commerce stores for UAE clients using Laravel and Flutter.
- Developed white-label SaaS platform for e-commerce distribution and automated onboarding.
- Completed 20+ projects for clients in UAE/KSA including mobile apps, custom dashboards, and integrations.
- Created reusable code templates and internal dev guidelines to standardize project delivery.

Full Stack Developer
SPC Tech | Dec 2023 - Feb 2024
- Built modern taxi booking app using Flutter and Firebase with real-time driver tracking.
- Integrated Node.js backend with secure user authentication and scalable ride management.
- Improved app load time and UX with optimized assets and async state loading.

Full Stack Developer
Knooz Misr | Dec 2021 - Dec 2022
- Designed and deployed system to manage operations of 13 marble factories.
- Built real-time production and stock dashboard using Laravel + JS.
- Streamlined workflow, reducing manual entry time by ~40%.

Remote Developer
Arinanetwork | Jun 2019 - Nov 2021
- Developed ERP system used by multiple companies with offline access and auto-sync logic.
- Created license protection system using advanced source code hashing.
- Documented system architecture and provided training materials for remote teams.
""")

pdf.section("Technical Skills",
"""- Backend: Laravel, PHP, Node.js, MySQL, RESTful APIs, GraphQL
- Frontend: Flutter, HTML, CSS, JavaScript, ReactJS, jQuery
- State Management: Provider, BLoC
- Payments: OPay, STC Pay (KSA), Paymob, TELR (UAE), FAWRY, KASHIER
- DevOps: Docker, GitHub Actions, Unit Testing
- Server Management: Ubuntu, Linux
- AI & APIs: Ollama Local API, Custom AI integration
- Packages: Laravel packages (e.g., laravel-payments), Flutter packages
"""
)

pdf.section("Soft Skills",
"- Team leadership and mentoring\n- Problem-solving under pressure\n- Communication and documentation\n- Agile collaboration")

pdf.section("Education",
    "Bachelor of Science in Civil Engineering\n"
    "Al-Azhar University, Cairo, Egypt\n"
    "Graduated: 2021"
)

pdf.section("Personal Information",
"- Nationality: Egyptian\n- Marital Status: Married\n- Military Service: Completed\n- Driving License: Yes"
)

pdf.section("Online Profiles",
"- Website: https://alalfy.com\n"
"- Startup: https://yotech.org\n"
"- LinkedIn: https://www.linkedin.com/in/islam-hassan-alalfy-2b2234167\n"
"- GitHub: https://github.com/EngALAlfy\n"
"- WhatsApp: https://api.whatsapp.com/send?phone=201153263994"
)

pdf.output("D:\\AI\\Islam_Alalfy_CV_2025.pdf")
print("✅ PDF generated successfully.")
