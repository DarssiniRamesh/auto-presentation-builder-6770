#!/bin/bash
cd /home/kavia/workspace/code-generation/auto-presentation-builder-6770/presentation_frontend
npm run lint
ESLINT_EXIT_CODE=$?
if [ $ESLINT_EXIT_CODE -ne 0 ]; then
  exit 1
fi

