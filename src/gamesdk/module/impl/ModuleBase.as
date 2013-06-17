package gamesdk.module.impl {
	import flash.display.DisplayObjectContainer;
	import flash.display.Loader;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import gamesdk.module.core.IModule;
	import gamesdk.module.core.IModuleConfigManager;
	import gamesdk.module.core.IModuleDataCenter;
	import gamesdk.module.core.IModuleManager;
	import gamesdk.module.core.IReflector;
	import gamesdk.module.core.IScreenManager;
	import gamesdk.module.GlobalsVars;
	import gamesdk.module.ModuleLauncher;
	import gamesdk.tools.ToolsMain;
	
	/**
	 * 模块基类。
	 * @author hanxianming
	 */
	public class ModuleBase extends Sprite implements IModule {
		protected var $dataCenter:IModuleDataCenter;
		protected var $moduleManager:IModuleManager;
		protected var $configManager:IModuleConfigManager;
		protected var $reflector:IReflector;
		protected var $screenManager:IScreenManager;
		protected var $loader:Loader;
		
		public function ModuleBase() {
			$dataCenter = ModuleLauncher.dataCenter;
			$moduleManager = ModuleLauncher.moduleManager;
			$configManager = ModuleLauncher.configManager;
			$reflector = ModuleLauncher.reflector;
			$screenManager = ModuleLauncher.screenManager;
		}
		
		/**
		 * @inheritDoc
		 */
		public function get moduleType():String {
			return "ModuleBase";
		}
		
		/**
		 * @inheritDoc
		 */
		public function init():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function show(father:DisplayObjectContainer, index:int = -1):void {
			if (father == null) {
				ToolsMain.log.error("[module]" + moduleType + "不能被添加到空对象中。");
				return;
			}
			/*var child:* = this;
			   if (GlobalsVars.dynamicLoad) {
			   child = $loader;
			   } else {
			   child = this;
			 }*/
			if (index == -1) {
				father.addChild(this);
			} else {
				father.addChildAt(this, index);
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function exit():void {
		
		}
		
		/**
		 * @inheritDoc
		 */
		public function disposeModule():void {
			$dataCenter = null;
			$moduleManager = null;
			$configManager = null;
			$reflector = null;
			$screenManager = null;
			$loader = null;
		}
		
		/**
		 * @inheritDoc
		 */
		public function removeFromParent(unload:Boolean = false):void {
			if (unload) {
				$moduleManager.destoryModule(moduleType);
			} else {
				if (this.parent != null) {
					this.parent.removeChild(this);
				}
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function get loader():Loader {
			return $loader;
		}
		
		public function set loader(value:Loader):void {
			$loader = value;
		}
	
	}

}