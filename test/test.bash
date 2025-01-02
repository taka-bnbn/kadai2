name: test
on: push
jobs:
  test:
    runs-on: ubuntu-24.04
    strategy:
      matrix:
         python-version: ["3.7","3.8","3.9","3.10","3.11"]
      container: ryuichiueda/ubuntu22.04-ros2:latest
    steps:
      - uses: actions/checkout@v2
      - name: build and test
        run: |
          rsync -av ./ /root/ros2_ws/src/mypkg/
          cd /root/ros2_ws
          bash -xv ./src/mypkg/test/test.bash /root