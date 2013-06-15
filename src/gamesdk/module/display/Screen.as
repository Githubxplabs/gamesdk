package gamesdk.module.display {
	import flash.display.DisplayObjectContainer;
	import flash.display.Sprite;
	import gamesdk.module.core.IModuleConfigManager;
	import gamesdk.module.core.IModuleDataCenter;
	import gamesdk.module.core.IModuleManager;
	import gamesdk.module.core.IReflector;
	import gamesdk.module.core.IScreen;
	import gamesdk.module.core.IScreenManager;
	import gamesdk.module.ModuleLauncher;
	
	/**
	 * ...
	 * @author hanxianming
	 */
	public class Screen extends Sprite implements IScreen {
		
		protected var $screenType:uint;
		protected var $screenName:String;
		protected var $fatherDisplay:DisplayObjectContainer;
		protected var $dataCenter:IModuleDataCenter;
		protected var $moduleManager:IModuleManager;
		protected var $configManager:IModuleConfigManager;
		protected var $reflector:IReflector;
		protected var $screenManager:IScreenManager;
		
		public function Screen(screenType:uint, screenName:String = "") {
			this.$screenType = screenType;
			this.$screenName = screenName;
			
			$dataCenter = ModuleLauncher.dataCenter;
			$moduleManager = ModuleLauncher.moduleManager;
			$configManager = ModuleLauncher.configManager;
			$reflector = ModuleLauncher.reflector;
			$screenManager = ModuleLauncher.screenManager;
			
			$screenManager.addScreen(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function get screenType():uint {
			return $screenType;
		}
		
		public function set screenType(value:uint):void {
			$screenType = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get screenName():String {
			return $screenName;
		}
		
		public function set screenName(value:String):void {
			$screenName = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get fatherDisplay():DisplayObjectContainer {
			return $fatherDisplay;
		}
		
		public function set fatherDisplay(value:DisplayObjectContainer):void {
			$fatherDisplay = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function show():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function dispose():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeAllDisplay():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeFromParent():void {
			if (parent != null)
				parent.removeChild(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function deleteFromScreens():void {
			$screenManager.removeScreen(this);
		}
		
		/**
		 * @inheritDoc
		 */
		public function destory():void {
			$fatherDisplay = null;
		}
		
		protected function switchScreen(screenType:uint):void {
			$screenManager.switchScreen(screenType);
		}
	
	}

}