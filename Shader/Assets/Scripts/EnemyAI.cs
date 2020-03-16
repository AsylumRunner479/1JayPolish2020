using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.AI;
using UnityEngine.UI;

public class EnemyAI : MonoBehaviour
{
    //desiginates who the player is
    public Transform target;
    public float curHealth, maxHealth, moveSpeed, attackRange, attackSpeed, noiseRange, sense;
    public NavMeshAgent agent;
    public Shader skin;
    //gives distances for how far away the player will be when they switch behaviour
    public float dist, sightDist;
    public bool Detected;
    public GameObject self;
    //public GameObject playerShadow;
    public float turnSpeed;
    public float sightAngle;
    public Movement movement;
   
    public Rigidbody rigid;
    
    public float AttackTimer;
    RaycastHit hit;
    public Vector3 DirFromAngle(float angleInDegrees, bool angleIsGlobal)
    {
        if (!angleIsGlobal)
        {
            angleInDegrees += transform.eulerAngles.y;
        }
        return new Vector3(Mathf.Sin(angleInDegrees * Mathf.Deg2Rad), 0, Mathf.Cos(angleInDegrees * Mathf.Deg2Rad));
    }
    void Start()
    {
        //sets the conditions at the start
        target = GameObject.FindGameObjectWithTag("Player").transform;
        agent = self.GetComponent<NavMeshAgent>();
        curHealth = 100f;
        maxHealth = curHealth;
        sightDist = 100f;
        sightAngle = 90f;
        moveSpeed = 10f;
        //skin = self.GetComponent<Material>();
        //skin.SetFloat("Damaged", curHealth / maxHealth);
        AttackTimer = attackSpeed;
    }
    public void TakeDamage(float damage)
    {
        curHealth -= damage;
        //skin.SetFloat("Damaged", curHealth / maxHealth);
    }
    void Update()
    {
        
        
       
            
        

        noiseRange = movement.noise * sense;
        //kills the enemy when they lose all their health
        if (curHealth <= 0)
        {
            Destroy(self);
        }
        //moves the enemy when the player is alive
        if (PlayerHandler.isDead == false)
        {
            agent.destination = target.position;



        }

    }
}