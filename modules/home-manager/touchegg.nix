{
  home.file.".config/touchegg/touchegg.conf".text = ''
    <touchégg>
      <settings>
        <property name="action_execute_threshold">10</property>
        <property name="color">auto</property>
        <property name="borderColor">auto</property>
      </settings>
      <application name="All">
        <gesture type="SWIPE" fingers="3" direction="DOWN">
          <action type="CHANGE_DESKTOP">
            <direction>down</direction>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="LEFT">
          <action type="CHANGE_DESKTOP">
            <direction>left</direction>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="RIGHT">
          <action type="CHANGE_DESKTOP">
            <direction>right</direction>
          </action>
        </gesture>
        <gesture type="SWIPE" fingers="3" direction="UP">
          <action type="CHANGE_DESKTOP">
            <direction>up</direction>
          </action>
        </gesture>
      </application>
    </touchégg>
  '';
}
