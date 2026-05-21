import { appTasks } from '@ohos/hvigor-ohos-plugin';
import { abnerRouter } from 'ohos-router/router-plugin';
export default {
    system: appTasks,  /* Built-in plugin of Hvigor. It cannot be modified. */
    plugins:[
        abnerRouter()
    ]         /* Custom plugin to extend the functionality of Hvigor. */
}
