part of values;

/// One of the four product surfaces (customer app, partner app, website, admin).
class PgSurface {
  final String title;
  final String platform;
  final String summary;
  final List<String> points;
  final IconData icon;

  const PgSurface({
    required this.title,
    required this.platform,
    required this.summary,
    required this.points,
    required this.icon,
  });
}

/// A backend service in the microservice topology.
class PgService {
  final String name;
  final String port;
  final String responsibility;

  const PgService({
    required this.name,
    required this.port,
    required this.responsibility,
  });
}

/// An engineering decision worth explaining rather than just listing.
class PgDecision {
  final String title;
  final String problem;
  final String solution;

  const PgDecision({
    required this.title,
    required this.problem,
    required this.solution,
  });
}

/// A headline number about the build itself — not usage, which does not exist yet.
class PgBuildStat {
  final String value;
  final String label;

  const PgBuildStat({required this.value, required this.label});
}

class PhoolGobhiData {
  static const String tagline = "Fitness, for all.";

  static const String status =
      "Pre-launch — Android app in Play Console closed testing, "
      "full stack deployed to dev and production environments.";

  static const String intro =
      "Phool Gobhi is a pay-per-session fitness marketplace. You book a single "
      "gym session the way you book a cab — no membership, no joining fee, no "
      "contract. It exists because the Indian gym market sells twelve-month "
      "memberships to people who attend for three weeks, and prices out "
      "everyone who will not gamble on that.";

  static const String scope =
      "I designed, built, deployed and operate the whole thing myself — two "
      "mobile apps, six backend services, three web frontends, the payment "
      "rails, the CI/CD, and the analytics. This page is the engineering "
      "detail behind it.";

  static const List<PgBuildStat> buildStats = [
    PgBuildStat(value: "6", label: "Repositories"),
    PgBuildStat(value: "6", label: "Backend services"),
    PgBuildStat(value: "5", label: "Client applications"),
    PgBuildStat(value: "1", label: "Engineer"),
  ];

  // ── The four surfaces ──────────────────────────────────────────────────
  static const List<PgSurface> surfaces = [
    PgSurface(
      title: "Customer App",
      platform: "Flutter · Android & iOS",
      summary:
          "Where a member finds a gym, books a session, pays, and checks in.",
      icon: Icons.phone_iphone,
      points: [
        "Gym discovery with server-side amenity and price filters, plus a nearby-gyms map",
        "Per-session slot booking against live availability, computed from real bookings",
        "Wallet with Razorpay top-up — bookings and subscriptions debit the wallet, never a card directly",
        "Poster-QR self check-in with a 300 m geofence, and GPS request check-in at 50 m",
        "Attendance history with streaks, badges and referral rewards",
        "Gym-buddy: swipe discovery, mutual matching, chat and photos",
        "Clean Architecture with roughly 25 Cubits, GetIt dependency injection, flavour-separated dev and prod builds",
      ],
    ),
    PgSurface(
      title: "Partner App",
      platform: "Flutter · gym owners",
      summary:
          "Where a gym owner onboards, verifies attendance and watches revenue.",
      icon: Icons.storefront,
      points: [
        "Four-step onboarding wizard with a resumable local draft, so a half-finished signup survives a closed app",
        "Multi-gym support — one owner, many locations, with a switcher that push notifications respect",
        "QR scan verification of member check-ins using signed tokens",
        "Sales dashboard showing lifetime revenue net of platform commission, plus attendance rates",
        "Slot scheduling with per-slot pricing and blocked periods",
        "Earnings ledger and document upload for verification",
      ],
    ),
    PgSurface(
      title: "Website",
      platform: "Next.js 16 · React 19 · Tailwind 4",
      summary:
          "A full booking client, not a brochure. Everything the app does, in a browser.",
      icon: Icons.language,
      points: [
        "Backend-for-frontend architecture — the browser talks to Next route handlers, never to the gateway, and never sees a token",
        "Firebase phone OTP into httpOnly cookies scoped to the parent domain, so one login covers the marketing site and the partner dashboard",
        "Gym listings with structured data for search engines, seven-day slot availability, sitemap and robots handling",
        "Wallet top-up, booking confirmation with QR, attendance and cancellation flows",
        "A poster-QR landing route that deep-links into the app and falls back to browser geolocation check-in",
      ],
    ),
    PgSurface(
      title: "Partner Web & Admin",
      platform: "Next.js 16 · two separate apps",
      summary:
          "The operational back office — one for gyms, one for internal staff.",
      icon: Icons.dashboard_customize,
      points: [
        "Partner dashboard: revenue tiles, booking verification, schedule and pricing, documents, trainers, member roster",
        "Partner insights: conversion funnel, revenue trend, footfall heatmap and retention cohorts",
        "Admin gym-approval queue with document review and reject-with-reason",
        "Ten analytics views including weekly retention cohorts, city breakdown and a per-user event timeline",
        "Payout recording, staff invitation and revocation, and remote app-version gating for force updates",
      ],
    ),
  ];

  // ── Backend topology ───────────────────────────────────────────────────
  static const List<PgService> services = [
    PgService(
      name: "API Gateway",
      port: "5000",
      responsibility:
          "Single entry point. Verifies JWTs, strips client-supplied identity headers, enforces a public-route allowlist and proxies to services.",
    ),
    PgService(
      name: "auth-service",
      port: "5001",
      responsibility:
          "OTP and Google sign-in, access and refresh token issuance, users, saved addresses, and internal admin operations.",
    ),
    PgService(
      name: "wallet-service",
      port: "5003",
      responsibility:
          "Razorpay order creation and signature verification, webhooks, internal credit and debit with idempotency, partner payouts.",
    ),
    PgService(
      name: "gym-service",
      port: "5004",
      responsibility:
          "Gym records and discovery, image and document upload, reviews, slot definitions, and a server-side Places proxy.",
    ),
    PgService(
      name: "booking-service",
      port: "5005",
      responsibility:
          "Bookings and their state machine, check-in verification, push notifications, and thirteen analytics endpoints.",
    ),
    PgService(
      name: "buddy-service",
      port: "5007",
      responsibility:
          "Gym-buddy swipes, mutual matching, chat threads and photo storage.",
    ),
  ];

  static const String infra =
      "Each service is a Node 20 container on Google Cloud Run in asia-south1, "
      "with its own PostgreSQL database behind Prisma — no shared tables, no "
      "cross-service joins. Deployment is GitHub Actions with per-service path "
      "triggers, so only what changed redeploys; each release polls the new "
      "revision for health before traffic shifts, and migrations are gated "
      "behind that check. Service-to-service calls carry both an internal API "
      "key and a Google-signed identity token.";

  // ── Decisions worth explaining ─────────────────────────────────────────
  static const List<PgDecision> decisions = [
    PgDecision(
      title: "One session across five clients",
      problem:
          "Two mobile apps and three web apps all had to share an identity, without any of them holding a long-lived credential.",
      solution:
          "Fifteen-minute access tokens with single-use refresh rotation and a short reuse grace window. Web clients hold httpOnly cookies on a shared parent domain; mobile holds secure storage. Every client has to persist the rotated token or its users get logged out each cycle — which is exactly the bug that taught me to test it across all five.",
    ),
    PgDecision(
      title: "Money never trusts the client",
      problem:
          "A booking price arriving from a phone is a suggestion, not a fact.",
      solution:
          "Prices are resolved server-side and never accepted from the client. Bookings and subscriptions debit an internal wallet; Razorpay only ever tops that wallet up, with top-up amounts constrained to a server-side set. Payment signatures are HMAC-verified, credit and debit take idempotency keys, and a scheduled sweep reconciles anything the webhook missed.",
    ),
    PgDecision(
      title: "Attendance that cannot be faked",
      problem:
          "Partners are paid on completed sessions, so a member who can mark their own attendance can mint money.",
      solution:
          "Check-in QR codes are signed tokens rather than raw booking identifiers, so they cannot be forged or replayed from a screenshot. Self check-in additionally requires being inside a geofence, partner scanning is a separate verified path, and a session scanned outside its slot window is flagged rather than silently accepted.",
    ),
    PgDecision(
      title: "Owning the analytics",
      problem:
          "Funnel data is the most valuable thing a marketplace produces, and renting it back from a vendor gets expensive precisely when it starts mattering.",
      solution:
          "A first-party event pipeline writes to PostgreSQL, with an identical collector in the gateway and every service. It feeds thirteen analytics endpoints behind the admin portal — onboarding funnel, approval SLA, conversion, fulfilment, activation, city breakdown and weekly retention cohorts. Swappable to a hosted provider by changing one environment variable.",
    ),
    PgDecision(
      title: "No secrets on the client",
      problem:
          "A Maps key shipped in an APK is a key you have already lost.",
      solution:
          "Places autocomplete and details are proxied through the backend, so no client — mobile or web — carries a Maps key. Release builds fail outright if a key is wired in by mistake. The same rule covers the gateway URL and every service credential.",
    ),
  ];

  // ── Forward-looking ────────────────────────────────────────────────────
  static const String nextTitle = "Where it goes next";

  static const String nextBody =
      "Session booking is the wedge, not the destination. The same attendance "
      "data that pays a partner is also the most honest signal of whether "
      "someone's habit is actually forming — which is a far more interesting "
      "product than a booking engine.\n\n"
      "The next phase extends from gym access into preventive health: habit "
      "and consistency tracking, social accountability through the gym-buddy "
      "loop, and health context surfaced responsibly, with a clear route to a "
      "qualified doctor rather than an algorithmic verdict. It is being built "
      "behind feature flags and is not live to any user yet.";

  static const String investorNote =
      "Phool Gobhi is pre-launch and I am building it as founder and sole "
      "engineer. If you invest in early-stage consumer or health products and "
      "want the full picture — market, model, roadmap and where it stands — "
      "get in touch and I will walk you through it.";
}
