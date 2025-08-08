<div align="center">
  <img width="100" height="100" alt="NextWander Logo" src="https://i.ibb.co/VpPfstRv/next-wander.png" />
  <br>
  <h1>NextWander — Your AI-Powered Travel Companion ✈️</h1>
</div>

## Description

NextWander is an early-stage travel planning app for anyone who loves exploring destinations worldwide — from weekend getaways to long adventures across any continent.
Built with SwiftUI and MVVM-C, and powered by the OpenAI API, it aims to offer smart itineraries, offline notes, quick translations, and AI-driven packing lists.

## Project Status

🚧 **Currently in development** — core architecture, UI prototypes, and initial OpenAI API integration are in progress.
Expect frequent changes and incomplete features.

## Planned Features

* **Trip Timeline**: Upcoming, active, and past trips.
* **Shared Mode**: Sync across devices via iCloud/CloudKit.
* **AI Assist**:
  * Generate itineraries from city, days, and interests.
  * Instant translations with polite rephrasing.
  * Extract reservations from PDFs/emails.
  * Packing suggestions based on weather and activities.
* **Lists & Notes**: Packing lists, to-dos, favorite spots, and offline notes.

## Tech Stack

* Swift (SwiftUI, async/await)
* MVVM-C + Clean Modules
* SwiftData + iCloud sync
* OpenAI GPT models
* Designs in Figma

## Getting Started

```bash
git clone https://github.com/yourusername/NextWander.git
cd NextWander
open NextWander.xcodeproj
```

1. (Coming soon) Configure your OpenAI API key — integration setup will be documented once implemented.
2. Run on iOS 26 simulator or device (for now).

## Roadmap

* **Foundation & Setup**

  * [ ] Set up SwiftUI project with MVVM-C base structure
  * [ ] Configure Dependency Injection container
  * [ ] Add Design Tokens from Figma to code

* **Core Features**

  * [ ] Trips module — list upcoming/active/past trips
  * [ ] New Trip flow — create trip with city, dates, and notes
  * [ ] Trip Detail view — day-by-day itinerary display
  * [ ] AI itinerary generation via OpenAI API
  * [ ] AI-powered packing list suggestions
  * [ ] Offline notes and to-do lists

* **Data Layer**

  * [ ] Implement SwiftData persistence for trips and notes
  * [ ] Add iCloud/CloudKit sync for multi-device usage
  * [ ] Handle conflict resolution and offline mode

* **AI Integrations**

  * [ ] Configure OpenAI API client with secrets management
  * [ ] Build structured prompt templates for itinerary/packing
  * [ ] Add instant translation feature
  * [ ] Extract reservation details from PDFs/emails

* **UI & UX**

  * [ ] Implement navigation with NavigationStack and Coordinators
  * [ ] Build reusable components (Buttons, Cards, Input Fields)
  * [ ] Add loading, error, and empty states
  * [ ] Implement dark mode and accessibility support

* **Testing & QA**

  * [ ] Unit tests for UseCases and ViewModels
  * [ ] Snapshot tests for key screens
  * [ ] Manual QA for performance and usability

* **Launch Prep**

  * [ ] Create app icon and marketing assets
  * [ ] App Store Connect setup
  * [ ] Beta release via TestFlight
  * [ ] Gather feedback and iterate
 
---

**License**

License details will be added before the first public release.
