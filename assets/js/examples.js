$(document).ready(function(){
  $('#smartwizard').smartWizard({
    theme: 'arrows',
    autoAdjustHeight: false,
    showStepURLhash: false,
    anchorSettings: {
      anchorClickable: true, // Enable/Disable anchor navigation
      enableAllAnchors: true // Activates all anchors clickable all times
    }
  });
});
