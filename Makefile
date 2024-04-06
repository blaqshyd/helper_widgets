test:
	@echo "╠ Running test..."
	flutter pub get
	flutter test

build_runner:
	@echo "╠ Build runner on new project..."
	flutter pub get
	dart run build_runner build --delete-conflicting-outputs -v


clean-ios:
	flutter clean
	cd ios && rm -rf Podfile.lock
	cd ios && rm -rf Pods
	flutter pub get
	cd ios && pod install

clean:
	@echo "╠ Cleaning Project..."
	flutter clean
	flutter pub get

dart_mappable:
	@echo "||===== Setting up dart_mappable =====||"
	flutter pub add dart_mappable
	flutter pub add build_runner --dev
	flutter pub add dart_mappable_builder --dev
	
firebase-setup:
	@echo "╠ Init Firebase Project..."
	flutter pub add firebase_core
	flutter pub add firebase_storage
	flutter pub add firebase_auth
	flutter pub get

freezed:
	@echo "||===== Setting up freezed ======||"
	flutter pub add freezed_annotation
	flutter pub add json_annotation
	flutter pub add --dev build_runner
	flutter pub add --dev freezed
	flutter pub add --dev json_serializable

native_splash:
	@echo "╠ Creating native splash screen..."
	flutter clean
	dart run flutter_native_splash:create 
	flutter pub get

native_splash_custom:
	@echo "╠ Creating custom native splash screen..."
	flutter clean
	dart run flutter_native_splash:create --path=splash.yaml
	flutter pub get
	
deploy-android:
	@echo "╠ Sending Android Build to Closed Testing..."
	cd android && bundle install
	cd android/fastlane && bundle exec fastlane deploy

deploy-ios:
	@echo "╠ Sending iOS Build to TestFlight..."
	cd ios/fastlane && bundle install
	cd ios/fastlane && bundle exec fastlane deploy

deploy-web:
	@echo "╠ Sending Build to Firebase Hosting..."
	flutter build web
	firebase deploy

deploy: test deploy-android deploy-ios deploy-web

.PHONY: test clean deploy-android deploy-ios deploy-web