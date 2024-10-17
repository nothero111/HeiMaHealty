import { AbilityConstant, UIAbility, Want } from '@kit.AbilityKit';
import { hilog } from '@kit.PerformanceAnalysisKit';
import { window } from '@kit.ArkUI';
import { BusinessError } from '@kit.BasicServicesKit';
import preference from '../Until/preference'
import { CommonConstants } from '../common/constants/CommonConstants';
import DateUtil from '../Until/DateUtil';
import DbUtil from '../common/utils/DbUtil';
import recordModel from '../model/RecordModel';

export default class EntryAbility extends UIAbility {
async onCreate(want: Want, launchParam: AbilityConstant.LaunchParam) {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onCreate');
    //1.加载用户首选项
    preference.loadPreference(this.context,'myPrf')
    //2.初始化日期
    AppStorage.setOrCreate(CommonConstants.RECORD_DATE,DateUtil.beginTimeOfDay(new Date()))
    //3.初始化RDB工具
    await DbUtil.initDB(this.context)
    //4.建表
    DbUtil.createTable(recordModel.getCreateTableSql())

  }

  onDestroy(): void {
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onDestroy');
  }

  onWindowStageCreate(windowStage: window.WindowStage): void {
    // Main window is created, set main page for this ability
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageCreate');

    windowStage.loadContent('pages/WelcomePage', (err) => {
      if (err.code) {
        hilog.error(0x0000, 'testTag', 'Failed to load the content. Cause: %{public}s', JSON.stringify(err) ?? '');
        return;
      }


      hilog.info(0x0000, 'testTag', 'Succeeded in loading the content.');
    });


  }

  onWindowStageDestroy(): void {
    // Main window is destroyed, release UI related resources
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onWindowStageDestroy');
  }

  onForeground(): void {
    // Ability has brought to foreground
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onForeground');
  }

  onBackground(): void {
    // Ability has back to background
    hilog.info(0x0000, 'testTag', '%{public}s', 'Ability onBackground');
  }
}
