ifeq (run-flavor,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-apk,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-apk-flavor,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-appbundle,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

ifeq (build-ios,$(firstword $(MAKECMDGOALS)))
  RUN_ARGS := $(wordlist 2,$(words $(MAKECMDGOALS)),$(MAKECMDGOALS))
  $(eval $(RUN_ARGS):;@:)
endif

.PHONY=help

help:  ## This help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST) | sort

###
# Run section
###
clean: ## Clean our project build tmp files
	flutter clean && flutter pub get
run: ## Run any app with flavor name. e.g. make run base
	flutter run --release
xcode: ## Open xcode project
	open -a Xcode.app ios/
gitForce: ## Force git push
	git add .
	git commit --amend --no-edit
	git push -f
device: ## Open device on computer
	scrcpy
device-ip: ## Connect device with ip
	scrcpy --tcpip=192.168.0.6:6666
device-disconnect: ## Disconnect device with adb
	adb disconnect
device-connect: ## Connect device to adb
	adb connect 192.168.0.73:5555
device-update-apk: ## Update apk
	flutter packages pub run build_runner build --delete-conflicting-outputs
	flutter clean
	flutter pub get
	flutter build apk --release
	adb connect 192.168.0.6:6666
	adb shell pm uninstall -k --user 0 com.accesys.mercadito.acc_checkout
	adb install -r ./build/app/outputs/flutter-apk/app-mercadito-release.apk
	adb disconnect
active-adb: ## Active adm mode in device
	adb tcpip 5555
run-ios: ## Open xcode from build run
	open ios/Runner.xcworkspace


###
# Build section
###
mobx: ## BuildRunner mobx
	flutter packages pub run build_runner build --delete-conflicting-outputs 
build-apk: ## Build an APK of any app with flavor name. e.g. make build base
	flutter clean && flutter pub get && flutter build apk --release
build-appbundle: ## Build an APK of any app with flavor name. e.g. make build base
	flutter build appbundle --release
build-ios: ## Build an APK of any app with flavor name. e.g. make build base
	flutter build ios --release
install-custom-flavors: ## Run the base command for flutter_flavorizr. Be careful: IT WILL OVERRIDE SOME FILES
	flutter pub run flutter_flavorizr -p assets:download,assets:extract,android:androidManifest,android:buildGradle,android:dummyAssets,flutter:flavors,assets:clean,ide:config
	sed -i.bak '/class F {/,$d' lib/flavors.dart
	rm lib/flavors.dart.bak
run-flavor: ## Run any app with flavor name. e.g. make run base
	flutter run --flavor $(RUN_ARGS) -t lib/main_$(RUN_ARGS).dart
build-apk-flavor: ## Build an APK of any app with flavor name. e.g. make build base
	flutter packages pub run build_runner build --delete-conflicting-outputs
	flutter clean
	flutter pub get
	flutter build apk --flavor ${RUN_ARGS} -t lib/main_${RUN_ARGS}.dart

###
# Dependencies section
###
dependencies: ## Install all dependencies

	flutter pub get


###
# Tests section
###
test: ## Run all tests
	flutter test