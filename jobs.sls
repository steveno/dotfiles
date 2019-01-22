highstate:
  schedule.present:
    - function: state.apply
    - minutes: 60
