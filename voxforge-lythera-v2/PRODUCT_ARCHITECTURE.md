# VoxForge Lythera v2 — Product Architecture

## 1. Product thesis

VoxForge Lythera v2 is a dedicated creative studio for transforming Lythera prose into reusable voice-direction assets.

It is **not** merely a text-to-speech tool. Its core purpose is to help a creator convert a passage into a structured production object:

- who speaks,
- from which world-context,
- with what emotional force,
- in what narrative form,
- with which delivery logic,
- and how that object can later become audio, live narration, or a cinematic scene component.

## 2. Primary user jobs

### Writers and lore designers
- Refine prophecies, decrees, testimonies, and monologues.
- Test whether a passage reads like the intended in-world artifact.
- Prepare passages for later narration.

### Game masters and scene directors
- Build scene-ready narration briefs.
- Separate narrator lines, character lines, atmosphere, and reaction beats.
- Store reusable spoken assets by faction, era, or place.

### Audio and voice production workflows
- Convert prose into a clear direction brief.
- Define pace, cadence, pauses, emphasis words, and ambient context.
- Hand off a structured voice plan to future TTS or voice-agent systems.

## 3. Capability tiers

### Tier A — useful now as a planning product
- Lythera-specific editor.
- Structured metadata.
- Voice-style taxonomy.
- Voice plan builder.
- Scene composer.
- Archive and reusable production briefs.

### Tier B — next with integrations
- AI-assisted text classification.
- Automated delivery-note suggestions.
- Real TTS preview rendering.
- Voice-agent coaching.
- Exportable sample narrations.

### Tier C — long-term research vision
- Lore-aware semantic direction.
- Multi-speaker scenes.
- Adaptive ambience and automatic sound design.
- Fully rendered cinematic voice scenes.

## 4. Core modules

### 4.1 Voice Sanctum
The central studio for drafting and directing passages.

**Inputs**
- Title
- Speaker
- Faction
- Location
- Era
- Text class
- Scene purpose
- Emotional charge
- Source passage

**Outputs**
- Structured voice plan draft
- Initial direction notes
- Recommended voice-style preset
- Estimated reading duration

### 4.2 Direction Panel
A production-facing planning panel.

**Subsections**
- Cadence
- Pace
- Pause map
- Emphasis words
- Emotional contour
- Ambient suggestion
- Recording caution notes

### 4.3 Voice Style System
Narrative delivery archetypes rather than generic voices.

| Style | Use case |
|---|---|
| Oracle Hush | Prophecy, veiled revelation |
| Iron Regent | Decrees, authority, command |
| Ashen Archivist | Chronicles, reports, lore recitals |
| Veiled Assassin | Threats, covert confession |
| Dawn Herald | Invocation, hope, rallying speech |
| Exiled Saint | Testimony, sacred grief, distance |
| Warlord Broadcast | Mobilization, battle orders |
| Dreaming Child | Memory, omen, fragile wonder |

### 4.4 Voice Plan Builder
A structured output layer that stays useful even without final audio generation.

**Sections**
- Source text
- Speaker framing
- Selected style
- Scene intent
- Delivery brief
- Ambient layer
- Recording notes
- Export checklist

### 4.5 Scene Composer
A block-based storyboard layer.

**Lane types**
- Opening atmosphere
- Narrator line
- Character line
- Reaction beat
- Transition
- Silence

### 4.6 Archive
Persistent project library grouped by Lythera-native categories.

**Top-level groups**
- Dynasties
- Ruins
- Prophecies
- War Logs
- Divine Fragments
- Personal Testimonies

## 5. Product UX principles

1. **Lythera-first, not generic SaaS.**
2. **Honest capability framing.** Never imply live magic where only planning UI exists.
3. **Every page should create an asset.** The user leaves with a brief, scene, or archive item.
4. **Narrative identity beats technical clutter.** The UI can be rich, but each component must support production work.
5. **Readable under creative pressure.** Dense mood, clear controls.

## 6. Suggested data model

### entities
- User
- Project
- Passage
- SpeakerProfile
- VoiceStylePreset
- VoicePlan
- Scene
- SceneBlock
- ArchiveCollection
- IntegrationRun

### important relationships
- A project has many passages.
- A passage can produce one or more voice plans.
- A voice plan can belong to one scene.
- A scene contains ordered scene blocks.
- Archive collections group projects and plans.

## 7. Suggested technical direction

### Frontend
- React + TypeScript
- Tailwind CSS or equivalent utility-first system
- Component-driven UI
- Local persistence for early prototype mode

### Application layers
- Editor layer
- Planning layer
- Scene layer
- Archive layer
- Integration layer

### Integrations later
- TTS rendering service
- Voice-agent coaching
- Lore retrieval / semantic memory
- Export pipeline

## 8. Success criteria for v2

V2 is successful if it does three things clearly:

1. It is **immediately useful** as a Lythera voice-planning studio.
2. It **does not overpromise** about capabilities that still require integrations.
3. It creates a product structure that can be implemented as a maintainable web app, not merely as a concept board.
