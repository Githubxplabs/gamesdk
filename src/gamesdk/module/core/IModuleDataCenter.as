package gamesdk.module.core {
	
	/**
	 * 模块数据管理中心
	 * @author hanxianming
	 */
	public interface IModuleDataCenter {
		/**
		 * 注册数据层需要被创建的useinstanceClass和访问whenAskedFor的映射。
		 * @param	whenAskedFor 对象的访问类型。
		 * @param	useinstanceClass 需要被创建实例的类。
		 * @param	named 注册的名称。
		 */
		function registDataProxyClass(whenAskedFor:Class, useinstanceClass:Class, named:String = ""):void;
		/**
		 * 注册数据层数据instance实例和访问whenAskedFor的映射。
		 * @param	whenAskedFor 对象的访问类型。
		 * @param	instance Model层的数据实例。
		 * @param	named 注册的名称。
		 */
		function registDataProxyInstance(whenAskedFor:Class, instance:Object, named:String = ""):void
		/**
		 * 根据访问类型删除注册的映射。
		 * @param	whenAskedFor 访问的类型。
		 * @param	named 注册的名称
		 */
		function deleteDataProxyClass(whenAskedFor:Class, named:String = ""):void;
		/**
		 * 根据实例删除注册的映射。
		 * @param	request 实例。
		 * @param	named 注册的名称
		 */
		function deleteDataProxyInstance(request:Object, named:String = ""):void;
		/**
		 * 根据类的应用程序域名称获取注册的对象实例。例如gamesdk.module.core.ModuleDataCenter。
		 * @param	requestName 应用程序域名称
		 * @param	named 注册的名称
		 * @return 注册的对象实例。
		 */
		function getDataProxyByClassName(requestName:String, named:String = ""):Object;
		/**
		 * 根据访问类型获取注册的对象实例。
		 * @param	whenAskedFor 访问的类型。
		 * @param	named 注册的名称
		 * @return 注册的对象实例。
		 */
		function getDataProxyByObject(whenAskedFor:Object, named:String = ""):Object;
	
	}

}