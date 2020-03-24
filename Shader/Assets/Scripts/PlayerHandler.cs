using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class PlayerHandler : MonoBehaviour
{

    [Header("Value Variables")]
    public float maxHealth;

    public float curHealth, healRate;
    public Gradient grad;
    public Image fill;

    public Slider healthBar;

    [Header("Damage Effect Variables")]

    public GameObject deathImage;




    public static bool isDead = false;

    bool canHeal;
    float healTimer;

    

    public string character;
    public Text text;
    [Header("Check Point")]
    public Transform curCheckPoint;

    //[Header("Save")]
    //public PlayerSaveAndLoad saveAndLoad;
    // Start is called before the first frame update
    private void Start()
    {

        healRate = 0;
        fill.color = grad.Evaluate(1f);

    }

    // Update is called once per frame
    void Update()
    {
        if (curHealth <= 0 && !isDead)
        {
            Death();
        }
        if (healthBar.value != Mathf.Clamp01(curHealth / maxHealth))
        {
            LoseHealth();
        }

        if (Input.GetKeyDown(KeyCode.X))
        {

            curHealth -= 5;
        }




        if (!canHeal && curHealth < maxHealth && curHealth > 0)
        {
            healTimer += Time.deltaTime;
            if (healTimer >= 5)
            {
                canHeal = true;
            }
        }
    }
    void LoseHealth()
    {
        curHealth = Mathf.Clamp(curHealth, 0, maxHealth);
        healthBar.value = Mathf.Clamp01(curHealth / maxHealth);
        fill.color = grad.Evaluate(curHealth/maxHealth);
    }


    void Death()
    {

        isDead = true;
        text.text = "";
        deathImage.SetActive(true);


        Invoke("DeathText", 2f);
        Invoke("ReviveText", 6f);
        Invoke("Revive", 9f);
    }
    private void LateUpdate()
    {
        if (canHeal && curHealth < maxHealth && curHealth > 0)
        {
            HealOverTime();
        }

    }
    void Revive()
    {
        text.text = "";
        isDead = false;
        curHealth = maxHealth;


        this.transform.position = curCheckPoint.position;
        this.transform.rotation = curCheckPoint.rotation;
        deathImage.SetActive(false);

    }
    void DeathText()
    {
        text.text = "Well you've fucked up.";
    }
    void ReviveText()
    {
        text.text = "But I'll give you another chance";
    }

    
    public void DamagePlayer(float damage)
    {

        curHealth -= damage;
        canHeal = false;
        healTimer = 0;
    }

    public void HealOverTime()
    {
        if (curHealth > 0 && curHealth <= maxHealth && canHeal)
        {
            curHealth += Time.deltaTime * (healRate);
        }
    }
}
