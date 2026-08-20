#!/bin/bash
set -euo pipefail

GEMINI=/google/bin/releases/gemini-cli/tools/gemini

# 1. Directories setup
mkdir -p ~/.gemini/config/rules ~/.gemini/config/skills ~/.gemini/skills ~/.gemini/extensions

# 2. Gemini CLI Extensions
if [ -x "${GEMINI}" ]; then
  "${GEMINI}" extensions link /google/src/files/head/depot/google3/devtools/devassist/gemini_cli_for_google/extensions/coding/ || true
  "${GEMINI}" extensions link /google/src/files/head/depot/google3/devtools/devassist/gemini_cli_for_google/extensions/workspace/ || true
  "${GEMINI}" extensions link /google/src/files/head/depot/google3/notifications/platform/tools/gemini_cli/extensions/notifier || true
  "${GEMINI}" extensions link /google/src/files/head/depot/google3/experimental/users/ialan/tool_redirector/ || true

  # Gemini CLI Skills
  "${GEMINI}" skills link /google/src/files/head/depot/google3/learning/gemini/agents/skills/gchat || true
  "${GEMINI}" skills link /google/src/files/head/depot/google3/learning/gemini/agents/skills/duckie || true
  "${GEMINI}" skills link /google/src/files/head/depot/google3/learning/gemini/agents/skills/gemini_cli || true
  "${GEMINI}" skills link /google/src/files/head/depot/google3/learning/gemini/agents/skills/gdrive || true
  "${GEMINI}" skills link /google/src/files/head/depot/google3/learning/gemini/agents/skills/gdocs || true
fi

# 3. Jetski Shared / Team Skills (~/.gemini/config/skills/)
ln -sfn /google/src/files/head/depot/google3/hardware/gchips/ai/agents/skills/csp ~/.gemini/config/skills/csp
ln -sfn /google/src/files/head/depot/google3/platforms/datacenter/ai/agent_resources/skills/common/elephant_goldfish ~/.gemini/config/skills/elephant-goldfish
ln -sfn /google/src/files/head/depot/google3/hardware/gchips/ai/agents/skills/gem5/launch ~/.gemini/config/skills/gem5-launch
ln -sfn /google/src/files/head/depot/google3/hardware/gchips/ai/agents/skills/gem5/terminal ~/.gemini/config/skills/gem5-terminal
ln -sfn /google/src/files/head/depot/google3/learning/gemini/agents/skills/gerrit ~/.gemini/config/skills/gerrit

# 4. Personal Experimental Rules (~/.gemini/config/rules/)
for rule in /google/src/files/head/depot/google3/experimental/users/stimim/jetski/rules/*.md; do
  [ -f "$rule" ] && ln -sf "$rule" ~/.gemini/config/rules/
done

# 5. Personal Experimental Skills (~/.gemini/config/skills/)
for skill_dir in /google/src/files/head/depot/google3/experimental/users/stimim/jetski/skills/*; do
  [ -d "$skill_dir" ] && ln -sfn "$skill_dir" ~/.gemini/config/skills/$(basename "$skill_dir")
done

echo "Gemini / Jetski setup completed successfully."
